# Frontend Workaround Implementation for Backend API Mismatch

## Problem Statement
The backend API returns a simplified single-object response structure instead of the documented array-of-exchange-houses structure. This mismatch prevented the frontend from obtaining the required `serviceid` and `toCountry` parameters needed for the fee calculation API call.

## Backend API Response Structure Issue

**Current (WRONG) Backend Response:**
```json
{
  "result": {
    "service_id": "...",
    "fxRate": 22.5
  }
}
```

**Required (Expected) Backend Response:**
```json
{
  "result": [
    {
      "products": [
        {
          "serviceid": "...",
          "fxRate": 22.5
        }
      ]
    }
  ]
}
```

## Solutions Implemented

### 1. Modified: `exchange_house_list_provider.dart`

**Changes:**
- Added `_toCountry` field to store the to-country code
- Added `getToCountry` getter to expose the value
- Added `serviceId` fallback in `selectExchangeHouse()` to extract from fee object if product doesn't have it
- Enhanced `getExchangeHouseList()` to:
  - Dynamically map `toCurrency` to `toCountry` (INR → IN, PKR → PK, etc.)
  - Extract `service_id` from the current API response structure
  - Wrap single-object responses in an array for model compatibility

**Key Code Segment:**
```dart
// Determine toCountry based on currency
switch (toCurrency) {
  case 'INR':
    _toCountry = 'IN';
    break;
  case 'PKR':
    _toCountry = 'PK';
    break;
  // ... other currencies
}

// Extract serviceId from current API structure
if (processedData['result'] is Map) {
  final resultObj = processedData['result'] as Map<String, dynamic>;
  serviceId = resultObj['service_id']?.toString();
  // Wrap in array for model compatibility
  processedData['result'] = [resultObj];
}
```

### 2. Modified: `currency_selection_widget.dart`

**Changes:**
- Updated fee calculation API call to use `getExchangesNotifier.serviceId` instead of `selectedBeneficiary.getServiceID`
- Updated fee calculation API call to use `getExchangesNotifier.getToCountry` instead of `selectedBeneficiary.getToCountry`
- This ensures values come from the exchange house API response directly

**Key Code Segment:**
```dart
await feeCalculation.getRemittanceFee(
    context: context,
    feeFxId: selectedBeneficiary.getFeeFxID!,
    amount: selectedBeneficiary.getSendAmount,
    commissionType: "customer",
    fromCurrency: fromCode.value.isEmpty ? "AED" : fromCode.value,
    toCurrency: toCode.value.isEmpty ? "INR" : toCode.value,
    serviceId: getExchangesNotifier.serviceId ?? "",
    toCountry: getExchangesNotifier.getToCountry ?? "IN"
);
```

## How It Works

1. **User selects currencies** → `getExchangeHouseList()` is called
2. **Exchange House API returns data** → Notifier:
   - Maps toCurrency to toCountry code
   - Extracts service_id from current response
   - Stores both values in member variables
3. **User enters amount** → Widget calls fee calculation API with:
   - `serviceId` from exchange house notifier
   - `toCountry` from exchange house notifier
4. **API responds** → receive_amount is displayed in "THEY RECEIVE" field

## Data Flow Diagram

```
Currency Selection
    ↓
Exchange House API (.../customer/exchange-houses)
    ↓
[WORKAROUND] Extract service_id from response
[WORKAROUND] Map toCurrency to toCountry
    ↓
Store in ExchangeHouseListNotifier
    ↓
User enters amount
    ↓
Call Fee Calculation API with serviceId + toCountry from notifier
    ↓
Receive Amount displayed in UI
```

## Files Modified

1. **lib/core/notifier/remittance/exchange_house_list_provider.dart**
   - Added _toCountry field and getter
   - Added currency-to-country mapping
   - Added service_id extraction from current API response

2. **lib/screens/home/main/main_money/widgets/currency_selection_widget.dart**
   - Updated to use notifier's serviceId and toCountry instead of beneficiary values

## Testing Checklist

- [ ] Run Flutter app
- [ ] Navigate to remittance screen
- [ ] Select "FROM" currency (AED)
- [ ] Select "TO" currency (INR)
- [ ] Select beneficiary (India)
- [ ] Enter amount in "YOU SEND" field
- [ ] Verify "THEY RECEIVE" field auto-populates with receive_amount
- [ ] Check console logs for: "ServiceId captured: ..., ToCountry: IN"
- [ ] Verify fee calculation API returns 200 status (not 400)

## Fallback/Default Values

- **toCountry Default:** "IN" (India) - set as default for missing currencies
- **serviceId Default:** "" (empty string) - sent to API which will validate
- **If API call still fails:** Check backend API documentation (Backend_Exchange_API_Requirements.md)

## Future Work

Once backend team updates the API to return proper structure:
1. Remove currency-to-country mapping from notifier
2. Remove service_id extraction workaround
3. Remove array-wrapping workaround
4. Remove fallback values from widget
5. Return to using beneficiary notifier values directly

## Related Documentation

- Backend_Exchange_API_Requirements.md - Shows expected vs current API structure
- fee_calculation_api.dart - Includes all 4 required parameters
- fee_calculation_notifier.dart - Stores and retrieves receive_amount

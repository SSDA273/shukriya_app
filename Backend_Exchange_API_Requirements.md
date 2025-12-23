# Exchange House API - Required Structure Update

## Current Issue

The Exchange House API endpoint `/customer/exchange-houses` is currently returning a simplified structure that doesn't match the frontend requirements and causes null pointer exceptions.

**Current API Response:**
```json
{
  "message": "Success",
  "result": {
    "_id": "69413a591371956726d9f20e",
    "entity_id": "61e3badbdf3ceff3769ebf97", 
    "service_id": "675c1a1b2c8d9e3f4a1b2c61",
    "from_currency": "AED",
    "to_currency": "INR",
    "fx_rate": "22.5000",
    "modeOfTransfer": "BANK",
    "external_fx_rate": "undefined",
    "title": "",
    "is_external_fx_rate": false,
    "isDefault": false,
    "fx_rate_markUp": 0
  },
  "statusCode": 200
}
```

## Business Requirements

The application is designed as a **multi-exchange house comparison platform** where:

1. **Users can compare rates** from different exchange houses
2. **Users can select the best option** based on rates, fees, and preferences
3. **Each exchange house has branding** (names, logos, ratings)
4. **Different fee structures** and service levels are supported
5. **Future scalability** for adding more exchange house partners

## Required API Structure

The API should return an **array of exchange houses**, each with their products and fee structures:

```json
{
  "message": "Success",
  "result": [
    {
      "_id": "exchange_house_1",
      "name": "Al Ansari Exchange", 
      "descriptions": "Leading exchange house in UAE with 30+ years experience",
      "products": [
        {
          "_id": "product_1",
          "name": "Bank Transfer to India",
          "logo": "al_ansari_logo.png",
          "code": "BANK_TRANSFER_IN", 
          "hsnCode": "HSN001",
          "isActive": true,
          "isVerified": true,
          "isDeleted": false,
          "createdAt": "2023-01-15T10:00:00Z",
          "updatedAt": "2024-12-15T14:30:00Z",
          "service_sub_category_id": "sub_cat_1",
          "service_category_id": "cat_1",
          "serviceid": "675c1a1b2c8d9e3f4a1b2c61",
          "fee": {
            "_id": "fee_1",
            "entity_id": "61e3badbdf3ceff3769ebf97",
            "entity_key": "ENT-5678901234567890", 
            "service_id": "675c1a1b2c8d9e3f4a1b2c61",
            "from_currency": "AED",
            "to_currency": "INR",
            "fee_min": 10,
            "fee_max": 50,
            "fee_percentage": 0.5,
            "fee_flat": 15,
            "fee_currency": "AED",
            "fx_rate": 22.5000,
            "rate_validity": 3600,
            "isActive": true,
            "isDeleted": false,
            "createdAt": "2023-01-15T10:00:00Z",
            "updatedAt": "2024-12-15T14:30:00Z"
          }
        }
      ]
    },
    {
      "_id": "exchange_house_2", 
      "name": "UAE Exchange",
      "descriptions": "Trusted money transfer service across 31 countries",
      "products": [
        {
          "_id": "product_2",
          "name": "Express Bank Transfer",
          "logo": "uae_exchange_logo.png", 
          "code": "EXPRESS_BANK_TRANSFER",
          "hsnCode": "HSN002",
          "isActive": true,
          "isVerified": true,
          "isDeleted": false,
          "createdAt": "2023-02-01T09:00:00Z",
          "updatedAt": "2024-12-15T15:45:00Z", 
          "service_sub_category_id": "sub_cat_2",
          "service_category_id": "cat_1",
          "serviceid": "675c1a1b2c8d9e3f4a1b2c62",
          "fee": {
            "_id": "fee_2",
            "entity_id": "61e3badbdf3ceff3769ebf97",
            "entity_key": "ENT-5678901234567890",
            "service_id": "675c1a1b2c8d9e3f4a1b2c62", 
            "from_currency": "AED",
            "to_currency": "INR",
            "fee_min": 8,
            "fee_max": 45,
            "fee_percentage": 0.4,
            "fee_flat": 12,
            "fee_currency": "AED", 
            "fx_rate": 22.3500,
            "rate_validity": 1800,
            "isActive": true,
            "isDeleted": false,
            "createdAt": "2023-02-01T09:00:00Z",
            "updatedAt": "2024-12-15T15:45:00Z"
          }
        }
      ]
    },
    {
      "_id": "exchange_house_3",
      "name": "Western Union",
      "descriptions": "Global leader in cross-border money transfers", 
      "products": [
        {
          "_id": "product_3",
          "name": "Standard Transfer",
          "logo": "western_union_logo.png",
          "code": "STANDARD_TRANSFER",
          "hsnCode": "HSN003", 
          "isActive": true,
          "isVerified": true,
          "isDeleted": false,
          "createdAt": "2023-03-10T11:00:00Z",
          "updatedAt": "2024-12-15T16:20:00Z",
          "service_sub_category_id": "sub_cat_3", 
          "service_category_id": "cat_1",
          "serviceid": "675c1a1b2c8d9e3f4a1b2c63",
          "fee": {
            "_id": "fee_3",
            "entity_id": "61e3badbdf3ceff3769ebf97",
            "entity_key": "ENT-5678901234567890",
            "service_id": "675c1a1b2c8d9e3f4a1b2c63",
            "from_currency": "AED", 
            "to_currency": "INR",
            "fee_min": 12,
            "fee_max": 55,
            "fee_percentage": 0.6,
            "fee_flat": 18,
            "fee_currency": "AED",
            "fx_rate": 22.1000,
            "rate_validity": 7200,
            "isActive": true,
            "isDeleted": false,
            "createdAt": "2023-03-10T11:00:00Z", 
            "updatedAt": "2024-12-15T16:20:00Z"
          }
        }
      ]
    }
  ],
  "statusCode": 200
}
```

## Frontend Model Structure

The frontend expects this exact structure to match these models:

### ExchangeHouseModel
```dart
class ExchangeHouseModel {
  final String message;
  final List<ExchangeResultModel>? result;  // Array of exchange houses
  final int statusCode;
}
```

### ExchangeResultModel  
```dart
class ExchangeResultModel {
  final String? id;
  final String? name;                    // Exchange house name
  final String? descriptions;            // Exchange house description  
  final List<ExchangeProductModel>? products; // Array of products/services
}
```

### ExchangeProductModel
```dart
class ExchangeProductModel {
  final String? id;
  final String? name;                    // Product name
  final String? logo;                    // Logo file key for branding
  final String? code;                    // Product code
  final String? hsnCode;
  final bool? isActive;
  final bool? isVerified; 
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? serviceSubCategoryId;
  final String? serviceCategoryId; 
  final ExchangeFeeModel? fee;           // Fee and rate information
  final String? serviceId;
}
```

### ExchangeFeeModel
```dart
class ExchangeFeeModel {
  final String? id;
  final String? entityId;
  final String? entityKey;
  final String? serviceId;
  final String? fromCurrency;            // Source currency
  final String? toCurrency;              // Target currency
  final num? feeMin;                     // Minimum fee
  final num? feeMax;                     // Maximum fee  
  final num? feePercentage;              // Percentage-based fee
  final num? feeFlat;                    // Flat fee amount
  final String? feeCurrency;             // Fee currency
  final num? fxRate;                     // Exchange rate
  final num? rateValidity;               // Rate validity in seconds
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
```

## Request Parameters

**Endpoint:** `POST /api-customer/customer/exchange-houses`

**Current Request:**
```json
{
  "entity_id": "61e3badbdf3ceff3769ebf97",
  "entity_key": "ENT-5678901234567890", 
  "to_country": "IN",
  "modeOfTransfer": "BANK",
  "from_currency": "AED",
  "to_currency": "INR"
}
```

## Key Requirements

### 1. **Multiple Exchange Houses**
- Return 2-5 exchange houses per currency pair
- Each with different rates and fee structures
- Enables user choice and comparison

### 2. **Complete Fee Information** 
- Both flat fees (`fee_flat`) and percentage fees (`fee_percentage`)
- Minimum and maximum fee limits
- Fee currency specification
- Rate validity period for real-time updates

### 3. **Branding Support**
- Exchange house names and descriptions
- Logo file keys for UI display  
- Service categorization

### 4. **Business Logic**
- Only return `isActive: true` products
- Filter by `isDeleted: false` 
- Sort by best rates or user preferences
- Include rate validity for refresh timing

## Benefits of This Structure

1. **User Experience:** Users can compare and choose the best option
2. **Business Growth:** Easy to add new exchange house partners  
3. **Flexibility:** Support different fee models and service types
4. **Scalability:** Structured for future expansion and features
5. **Branding:** Each partner gets proper representation

## Migration Path

1. **Phase 1:** Update API to return array structure (even with 1 exchange house)
2. **Phase 2:** Add 2-3 exchange house partners with real data
3. **Phase 3:** Implement dynamic rate updates and fee calculations

## Testing

Please test with:
- Multiple currency pairs (AED→INR, AED→PKR, AED→BDT, etc.)
- Different transfer amounts (affects fee calculations)
- Rate validity and refresh scenarios
- Error cases (no exchange houses available)

---

**Contact:** Frontend Team  
**Priority:** High (Production Issue)  
**Timeline:** ASAP (API structure mismatch causing null pointer exceptions)
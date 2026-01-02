# Backup - API Endpoint Configuration
# Date: 2025-12-23
# Purpose: Keep original demo server configuration for rollback

## Original Configuration (Demo Server - DOWN)
```dart
class AppAPI {
  //UAT
  // static const baseUrl = "https://uat.mercury-pay.me/api";
  static const gieomUrl = "https://dev.mercury-pay.me/integrations/digital_validator";
  // static const gieomUrl = "https://digitalvalidator.ai:444";

  //Dev
  static const baseUrl = "http://demo.ctrmv.com:3000/api-customer";
}
```

## Changed To (UAT Server)
```dart
class AppAPI {
  //UAT
  static const baseUrl = "https://uat.mercury-pay.me/api";
  static const gieomUrl = "https://dev.mercury-pay.me/integrations/digital_validator";
  // static const gieomUrl = "https://digitalvalidator.ai:444";
}
```

## To Rollback

Replace the content back to the original demo server URL:
```dart
static const baseUrl = "http://demo.ctrmv.com:3000/api-customer";
```

File location: `lib/constant/api_const/app_api.dart`

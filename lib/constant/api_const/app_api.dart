import 'package:unitey_app/core/services/cache_services.dart';

class AppAPI {
  //UAT
  // static const baseUrl = "https://uat.mercury-pay.me/api";
  static const gieomUrl = "https://dev.mercury-pay.me/integrations/digital_validator";
  // static const gieomUrl = "https://digitalvalidator.ai:444";

  //Dev
  static const baseUrl = "http://78.47.213.212:3001/api-customer";

  static String getFileUrl(String? key) {
    if (key == null || key.isEmpty) return "";
    return key.startsWith("http") ? key : "$baseUrl/files?key=${Uri.encodeComponent(key)}";
  }
}

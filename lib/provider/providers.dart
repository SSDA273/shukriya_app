import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:unitey_app/core/notifier/account_details_notifier.dart';
import 'package:unitey_app/core/notifier/auth/auth_send_otp_notifier.dart';
import 'package:unitey_app/core/notifier/auth/auth_verify_otp_noitifier.dart';
import 'package:unitey_app/core/notifier/auth/forgot/forgot_password_notifier.dart';
import 'package:unitey_app/core/notifier/auth/forgot/forgot_user_id_send_notifier.dart';
import 'package:unitey_app/core/notifier/auth/pin_login_notifier.dart';
import 'package:unitey_app/core/notifier/auth/sign_up/emirates_id_notifier.dart';
import 'package:unitey_app/core/notifier/auth/sign_up/signup_verify_otp_notifier.dart';
import 'package:unitey_app/core/notifier/beneficiary/add_beneficiary_notifier.dart';
import 'package:unitey_app/core/notifier/beneficiary/beneficiary_list_notifier.dart';
import 'package:unitey_app/core/notifier/beneficiary/delete_beneficiary_notifier.dart';
import 'package:unitey_app/core/notifier/beneficiary/pay_remittance_notifier.dart';
import 'package:unitey_app/core/notifier/beneficiary/upload_beneficiary_image_notifier.dart';
import 'package:unitey_app/core/notifier/bill/bill_list_notifier.dart';
import 'package:unitey_app/core/notifier/bill/bill_service_fee_notifier.dart';
import 'package:unitey_app/core/notifier/bill/popular_bills_notifier.dart';
import 'package:unitey_app/core/notifier/billers/add_billers.notifier.dart';
import 'package:unitey_app/core/notifier/auth/auth_notifier.dart';
import 'package:unitey_app/core/notifier/billers/billers_list_notifier.dart';
import 'package:unitey_app/core/notifier/billers/billers_type_notifier.dart';
import 'package:unitey_app/core/notifier/billers/pay_bill_notifier.dart';
import 'package:unitey_app/core/notifier/billers/recent_billers_notifier.dart';
import 'package:unitey_app/core/notifier/change_language_notifier.dart';
import 'package:unitey_app/core/notifier/colors_notifier/colors_notifier.dart';
import 'package:unitey_app/core/notifier/customer/change_password/reset_password_notifier.dart';
import 'package:unitey_app/core/notifier/customer/change_password/reset_verify_notifier.dart';
import 'package:unitey_app/core/notifier/customer/customer_profile_notifier.dart';
import 'package:unitey_app/core/notifier/entity_info_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/get_gieom_instruction_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_face_match_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_fetch_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_liveness_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_process_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_token_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_upload_back_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_upload_front_notifier.dart';
import 'package:unitey_app/core/notifier/remittance/currency_list_notifier.dart';
import 'package:unitey_app/core/notifier/remittance/exchange_house_list_provider.dart';
import 'package:unitey_app/core/notifier/otp_generate_notifier.dart';
import 'package:unitey_app/core/notifier/otp_validation_notifier.dart';
import 'package:unitey_app/screens/auth/signup/time_provider.dart';
import '../core/notifier/auth/forgot/forgot_otp_verify_notifier.dart';
import '../core/notifier/remittance/fee_calculation_notifier.dart';
import 'beneficiary_select_notifier.dart';
import 'biller_select_notifier.dart';

List<SingleChildWidget> providers = [...remoteProvider];

//independent providers
List<SingleChildWidget> remoteProvider = [

  //Gieom
  ChangeNotifierProvider(create: (_) => GieomTokenNotifier()),
  ChangeNotifierProvider(create: (_) => GieomUploadFrontNotifier()),
  ChangeNotifierProvider(create: (_) => GieomUploadBackNotifier()),
  ChangeNotifierProvider(create: (_) => GieomProcessNotifier()),
  ChangeNotifierProvider(create: (_) => GieomFetchNotifier()),
  ChangeNotifierProvider(create: (_) => GetGieomInstructionNotifier()),
  ChangeNotifierProvider(create: (_) => GieomLivenessNotifier()),
  ChangeNotifierProvider(create: (_) => GieomFaceMatchNotifier()),
  ChangeNotifierProvider(create: (_) => TimeProvider()),

  //Language
  ChangeNotifierProvider(create: (_) => ChangeLanguageNotifier()),

  //Login
  ChangeNotifierProvider(create: (_) => PinLoginNotifier()),
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
  ChangeNotifierProvider(create: (_) => AuthVerifyOTPNotifier()),
  ChangeNotifierProvider(create: (_) => AuthSendOTPNotifier()),
  ChangeNotifierProvider(create: (_) => ForgotUserIDSendNotifier()),
  ChangeNotifierProvider(create: (_) => ForgotPasswordNotifier()),
  ChangeNotifierProvider(create: (_) => ForgotOTPVerifyNotifier()),
  ChangeNotifierProvider(create: (_) => ResetPasswordNotifier()),
  ChangeNotifierProvider(create: (_) => ResetVerifyNotifier()),

  //OTP
  ChangeNotifierProvider(create: (_) => OTPGenerateNotifier()),
  ChangeNotifierProvider(create: (_) => OTPValidationNotifier()),


  //Beneficiary
  ChangeNotifierProvider(create: (_) => BeneficiarySelectNotifier()),
  ChangeNotifierProvider(create: (_) => BeneficiaryListNotifier()),
  ChangeNotifierProvider(create: (_) => AddBeneficiaryNotifier()),
  ChangeNotifierProvider(create: (_) => PayRemittanceNotifier()),
  ChangeNotifierProvider(create: (_) => DeleteBeneficiaryNotifier()),
  ChangeNotifierProvider(create: (_) => CurrencyListNotifier()),
  ChangeNotifierProvider(create: (_) => ExchangeHouseListNotifier()),
  ChangeNotifierProvider(create: (_) => FeeCalculationNotifier()),

  //Billers
  ChangeNotifierProvider(create: (_) => AddBillersNotifier()),
  ChangeNotifierProvider(create: (_) => BillersTypeNotifier()),
  ChangeNotifierProvider(create: (_) => PayBillNotifier()),
  ChangeNotifierProvider(create: (_) => BillListNotifier()),
  ChangeNotifierProvider(create: (_) => BillerListNotifier()),
  ChangeNotifierProvider(create: (_) => BillsSelectionNotifier()),
  ChangeNotifierProvider(create: (_) => BillServiceFeeNotifier()),
  ChangeNotifierProvider(create: (_) => PopularBillsNotifier()),
  ChangeNotifierProvider(create: (_) => RecentBillersNotifier()),


  //Customer
  ChangeNotifierProvider(create: (_) => AccountDetailsNotifier()),
  ChangeNotifierProvider(create: (_) => CustomerProfileNotifier()),
  ChangeNotifierProvider(create: (_) => UploadImageNotifier()),
  ChangeNotifierProvider(create: (_) => EntityInfoNotifier()),
  ChangeNotifierProvider(create: (_) => ColorsNotifier()),


  ChangeNotifierProvider(create: (_) => EmiratesIdNotifier()),
  ChangeNotifierProvider(create: (_) => SignUpOTPValidationNotifier()),
];

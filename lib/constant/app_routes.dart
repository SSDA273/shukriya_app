import 'package:unitey_app/screens/intro/onboarding_screen.dart';
import 'package:unitey_app/screens/intro/splash_screen.dart';
import 'package:unitey_app/screens/auth/login/forgot_password/forgot_password_screen.dart';
import 'package:unitey_app/screens/main_screen.dart';
import '../screens/home/add_beneficiary/add_beneficiary_screen.dart';
import '../screens/home/exchange_houses_list/exchange_houses_list_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/pay_bills/pay_bills_details_screen.dart';
import '../screens/home/profile/edit_screen/profile_edit_screen.dart';
import '../screens/home/profile/profile_screen.dart';
import '../screens/intro/language_selection_screen.dart';
import '../screens/auth/login/finger_print_screen.dart';
import '../screens/auth/login/login_screen.dart';
import '../screens/auth/signup/emirates_upload_screen.dart';

const String splashRoute = "/intro";
const String languageRoute = "/language";
const String loginRoute = "/login";
const String pinRoute = "/pin";
const String forgotPasswordRoute = "/forgotPassword";
const String signupRoute = "/signup";
const String onBoardingRoute = "/onBoarding";
const String mainRoute = "/main";
const String homeRoute = "/home";
const String exchangeHousesListRoute = "/exchangeHousesList";
const String addBeneficiaryRoute = "/addBeneficiary";
const String profileRoute = "/profile";
const String editProfileRoute = "/editProfile";
const String payBillsDetailsRoute = "/payBillsDetails";

final routes = {
  splashRoute: (context) => const SplashScreen(),
  languageRoute: (context) => const LanguageSelectionScreen(),
  loginRoute: (context) => const LoginScreen(),
  pinRoute: (context) => const FingerPrintScreen(),
  forgotPasswordRoute: (context) =>  const ForgotPasswordScreen(),
  signupRoute: (context) => const EmiratesUploadScreen(),
  onBoardingRoute: (context) => const OnBoardingScreen(),
  mainRoute: (context) => const MainScreen(),
  homeRoute: (context) => HomeScreen(),
  exchangeHousesListRoute: (context) => const ExchangeHousesListScreen(),
  addBeneficiaryRoute: (context) => const AddBeneficiaryScreen(),
  profileRoute: (context) => const ProfileScreen(),
  editProfileRoute: (context) => const EditProfileScreen(),
  payBillsDetailsRoute: (context) => const PayBillsDetailsScreen(),
};

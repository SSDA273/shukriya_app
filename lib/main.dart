import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/core/notifier/change_language_notifier.dart';
import 'package:unitey_app/generated/l10n.dart';
import 'package:unitey_app/provider/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constant/theme_manager.dart';

//delete this whenever you got context idea
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

late List<CameraDescription> cameras;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  // @override
  // void initState() {
  //
  //   // SmartlookHelperWidget
  //   // SetupOptions options = (SetupOptionsBuilder('5afc9a150f8c364945bccb81fbda3de85189d32a')
  //   // ).build();
  //   // Smartlook.setupAndStartRecording(options);
  //   super.initState();
  // }



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(builder: (context) {
        return ScreenUtilInit(
          designSize: const Size(360, 640),
          minTextAdapt: true,
          splitScreenMode: true,
          child: OverlaySupport.global(
            child: MaterialApp(
              navigatorKey: navigatorKey,
              scaffoldMessengerKey: snackbarKey,
              locale: Provider.of<ChangeLanguageNotifier>(context, listen: true)
                  .currentLocale,
              theme: getApplicationTheme(),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              routes: routes,
              initialRoute: splashRoute,
            ),
          ),
        );
      }),
    );
  }
}

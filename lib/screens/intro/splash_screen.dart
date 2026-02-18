import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/core/notifier/change_language_notifier.dart';
import 'package:unitey_app/core/services/cache_services.dart';

import 'package:lottie/lottie.dart';

import '../../core/notifier/colors_notifier/colors_notifier.dart';
import '../../constant/color_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _asyncMethod();
    // });
    Timer(const Duration(milliseconds: 7000), () => checkCredential(context));
    super.initState();
  }
  _asyncMethod() async {
    await Provider.of<ColorsNotifier>(context,listen: false).getColors(context: context);
  }

  void checkCredential(BuildContext context) async {
    final CacheService cacheService = CacheService();
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
    //     (route) => false);
    // Todo: Uncomment whenever colors added in the backend

    final token = await cacheService.readCache(key: "token");
    final language = await cacheService.readCache(key: "language");
    final onBoarded = await cacheService.readCache(key: "onBoarded");
    final firstName = await cacheService.readCache(key: "firstName");

    if (token != null && onBoarded != null && language != null) {
      context.read<ChangeLanguageNotifier>().changeLocale(language);
      bool hasExpired = JwtDecoder.isExpired(token);
      print("is Token Expired? $hasExpired");
      if (hasExpired) {
        Navigator.pushNamedAndRemoveUntil(
            context, loginRoute, (route) => false);
      } else {
        context.read<ChangeLanguageNotifier>().changeLocale(language);
        // Navigator.pushNamedAndRemoveUntil(
        //     context, loginRoute, (route) => false);
        //Todo: change whenever pin screen complete
        Navigator.pushNamedAndRemoveUntil(context, pinRoute, (route) => false,
            arguments: firstName);
      }
    } else if (onBoarded != null && language != null) {
      Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, languageRoute, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.primary,
//       body:  Lottie.asset(ImageAssets.splash,
//       fit: BoxFit.fill,
//       onLoaded: (composition){
//         animationController.addStatusListener((status) {
//           if(status == AnimationStatus.completed){
//
// checkCredential(context);
//           }
//         });
//         animationController.forward();
//         // ..duration = composition.duration
//
//       },
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorManager.splashPrimary,
              ColorManager.splashDarkPrimary,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/al_ghurair_logo.png",
              height: 120,
              width: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              "ESTD. 1981",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class SplashScreen extends HookWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     _asyMethod() async {
//       await Provider.of<ColorsNotifier>(context, listen: false)
//           .getColors(context: context);
//       Timer(const Duration(milliseconds: 7000), () => checkCredential(context));
//     }
//
//     useEffect(
//       () {
//         _asyMethod();
//       },[],
//     );
//     return Scaffold(
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Image.asset(
//           "assets/images/splash.gif",
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//   void checkCredential(BuildContext context) async {
//     final CacheService cacheService = CacheService();
//     // Navigator.of(context).pushAndRemoveUntil(
//     //     MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
//     //     (route) => false);
//     // Todo: Uncomment whenever colors added in the backend
//
//     final token = await cacheService.readCache(key: "token");
//     final language = await cacheService.readCache(key: "language");
//     final onBoarded = await cacheService.readCache(key: "onBoarded");
//     final firstName = await cacheService.readCache(key: "firstName");
//
//     if (token != null && onBoarded != null && language != null) {
//       context.read<ChangeLanguageNotifier>().changeLocale(language);
//       bool hasExpired = JwtDecoder.isExpired(token);
//       print("is Token Expired? $hasExpired");
//       if (hasExpired) {
//         Navigator.pushNamedAndRemoveUntil(
//             context, loginRoute, (route) => false);
//       } else {
//         context.read<ChangeLanguageNotifier>().changeLocale(language);
//         // Navigator.pushNamedAndRemoveUntil(
//         //     context, loginRoute, (route) => false);
//         //Todo: change whenever pin screen complete
//         Navigator.pushNamedAndRemoveUntil(context, pinRoute, (route) => false,
//             arguments: firstName);
//       }
//     } else if (onBoarded != null && language != null) {
//       Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
//     } else {
//       Navigator.pushNamedAndRemoveUntil(
//           context, languageRoute, (route) => false);
//     }
//   }
// }

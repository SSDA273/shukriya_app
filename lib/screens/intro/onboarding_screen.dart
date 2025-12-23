import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/generated/l10n.dart';
import '../../constant/asset_manager.dart';
import 'package:lottie/lottie.dart';
import '../../constant/constants.dart';
import '../../constant/style_manager.dart';
import '../../constant/values_manger.dart';

class OnBoardingScreen extends HookWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numPages = useState<int>(3);
    final currentPage = useState<int>(0);
    final PageController pageController = usePageController(initialPage: 0);

    List<Widget> _buildPageIndicator(Color activeColor, Color inActiveColor) {
      List<Widget> list = [];
      for (int i = 0; i < numPages.value; i++) {
        list.add(i == currentPage.value
            ? _indicator(true, activeColor, inActiveColor)
            : _indicator(false, activeColor, inActiveColor));
      }
      return list;
    }

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.19,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int page) {
                  currentPage.value = page;
                },
                children: <Widget>[
                  ////////////////Page 1//////////////////
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 58),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xfff4b277),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        // alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Lottie.asset(
                              ImageAssets.onBoardingLottie1,
                              fit: BoxFit.contain,
                              height: 300.h,
                            ),
                            // Lottie.asset(ImageAssets.onBoardingLottie1),
                            kSizedBox35,
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                S.of(context).onboarding1,
                                // "Instant money transfer\nto your family and friends",
                                textAlign: TextAlign.center,

                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: ColorManager.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white10,
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ////////////////Page 2//////////////////
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 58),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: //Color(0xff7b3884),
                          Color(0xFF1B5E20),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        // alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              ImageAssets.onBoardingLottie2,
                              fit: BoxFit.contain,
                              height: 300.h,
                            ),
                            // Lottie.asset(ImageAssets.onBoardingLottie2),
                            kSizedBox35,
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                S.of(context).onboarding2,
                                // "Pay bills sitting at home\nand never worry again",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: ColorManager.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: InkWell(
                            onTap: () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white10,
                              child: Icon(
                                Icons.arrow_back,
                                color: ColorManager.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                  ////////////////Page 3//////////////////
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 28),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color:Color(0xFF2E7D32),
                          //Color(0xffd75393),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        // alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              ImageAssets.onBoardingLottie3,
                              fit: BoxFit.contain,
                              height: 300.h,
                            ),
                            kSizedBox24,
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                S.of(context).onboarding3,
                                // "Scan and receive\nmoney",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: ColorManager.white),
                              ),
                            ),
                            kSizedBox24,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(
                                  ColorManager.white, ColorManager.white),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: InkWell(
                            onTap: () {
                              pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white10,
                              child: Icon(
                                Icons.arrow_back,
                                color: ColorManager.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom Button Section
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal:
                      currentPage.value != numPages.value - 1 ? 31 : 15),
              child: Row(
                mainAxisAlignment: currentPage.value != numPages.value - 1
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.spaceEvenly,
                children: [
                  currentPage.value != numPages.value - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(
                              ColorManager.primary, ColorManager.grey4),
                        )
                      : const SizedBox(),
                  currentPage.value != numPages.value - 1
                      ? InkWell(
                          onTap: () async {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: CircleAvatar(
                            radius: 21,
                            backgroundColor: ColorManager.grey5,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorManager.white,
                              child: Icon(
                                Icons.arrow_forward,
                                color: ColorManager.primary,
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                loginRoute,
                              ),
                              child: Container(
                                height: 46,
                                width: 177,
                                padding: const EdgeInsets.only(
                                    left: AppPadding.p34,
                                    right: AppPadding.p8,
                                    top: 5,
                                    bottom: 6),
                                decoration: BoxDecoration(
                                  gradient:  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ColorManager.primary,
                                      //const Color(0xffC34BD4),
                                      Color.fromARGB(255, 77, 187, 55),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(S.of(context).signIn,
                                          style: getSemiBoldStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s16)),
                                    ),
                                    Container(
                                        height: 33,
                                        width: 33,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(
                                                    255, 255, 255, 0.5),
                                                Color.fromRGBO(
                                                    255, 255, 255, 0),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            )),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                          color: ColorManager.white,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            kSizedW15,
                            OutlinedButton(
                                style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        const Size(136, 50)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                                color: ColorManager.grey4)))),
                                onPressed: () async {
                                  Navigator.pushNamed(context, signupRoute);
                                },
                                child: Text(S.of(context).signUp,
                                    style: getSemiBoldStyle(
                                        color: ColorManager.primary,
                                        fontSize: FontSize.s16)))
                          ],
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(
    bool isActive,
    Color activeColor,
    Color inActiveColor,
  ) {
    return Container(
      // duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 6,
      width: isActive ? 24 : 6,
      decoration: BoxDecoration(
          color: isActive ? activeColor : inActiveColor,
          shape: isActive ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isActive ? BorderRadius.circular(10) : null),
    );
  }
}


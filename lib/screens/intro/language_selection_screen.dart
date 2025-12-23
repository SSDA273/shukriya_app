import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/core/notifier/change_language_notifier.dart';
import '../../constant/asset_manager.dart';
import '../../constant/color_manger.dart';
import '../../core/services/cache_services.dart';

class LanguageSelectionScreen extends HookWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> languages = <Map<String, dynamic>>[
    <String, dynamic>{
      'welcomeText': 'Welcome to Shukriya',
      'languageText': 'English',
      'code': 'en',
    },
    <String, dynamic>{
      'welcomeText': 'शुक्रिया में आपका स्वागत है',
      'languageText': 'Hindi',
      'code': 'hi',
    },
    <String, dynamic>{
      'welcomeText': 'சுக்ரியாவை வரவேற்கிறோம்',
      'languageText': 'Tamil',
      'code': 'ta',
    },
    <String, dynamic>{
      'welcomeText': 'شکریہ میں خوش آمدید',
      'languageText': 'Urdu',
      'code': 'ur',
    },
    <String, dynamic>{
      'welcomeText': 'مرحبا بكم في الشكرية',
      'languageText': 'Arabic',
      'code': 'ar',
    },
    <String, dynamic>{
      'welcomeText': 'Maligayang pagdating sa shukriya',
      'languageText': 'Filipino',
      'code': 'fil',
    },
    <String, dynamic>{
      'welcomeText': 'ശുക്രിയയിലേക്ക് സ്വാഗതം',
      'languageText': 'Malayalam',
      'code': 'ml',
    },
    <String, dynamic>{
      'welcomeText': 'शुक्रियामा स्वागत छ',
      'languageText': 'Nepali',
      'code': 'ne',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final optionSelected = useState<int>(0);
    Future<void> checkOption(int index) async {
      final CacheService cacheService = CacheService();
      print(languages[index - 1]['code']);
      final selected = languages[index - 1]['code'];

      optionSelected.value = index;

      await cacheService.writeCache(key: "language", value: selected).then((_) {
        context.read<ChangeLanguageNotifier>().changeLocale(selected);
        Navigator.pushNamed(context, onBoardingRoute);
      });
    }
    return Scaffold(
        // backgroundColor: const Color(0xFF331535),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Align(
            alignment: Alignment.topCenter,
            child: IconButton(
              icon: Icon(Icons.adaptive.arrow_back,
              color: ColorManager.black3,),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          titleSpacing: 0,
          toolbarHeight: 60,
          centerTitle: false,
          title: Text(
            "Choose your \npreferred language",
            textAlign: TextAlign.start,
            style:Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorManager.black3),
          ),
        ),
        body:  Stack(
    children: [
    Positioned(
   bottom: 0,
        right: 0,
        child: Image.asset(
          ImageAssets.languageBg,
        )),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding:  EdgeInsets.fromLTRB( 48.w,16.h,50.w,26.h),
              mainAxisSpacing: 14.h,
              crossAxisSpacing: 30.w,
              children: [
                for (int i = 0; i < languages.length; i++)
                  LanguageContainer(
                    languageText: languages[i]['languageText'],
                    welcomeText: languages[i]['welcomeText'],
                    onTap: () => checkOption(i + 1),
                    selected: i + 1 == optionSelected.value,
                  ),
              ],
            ),
          ],
        ));
  }
}

class LanguageContainer extends StatelessWidget {
  const LanguageContainer({
    required this.languageText,
    required this.welcomeText,
    required this.onTap,
    required this.selected,
    Key? key,
  }) : super(key: key);
  final String languageText;
  final String welcomeText;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding:  EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
        decoration: BoxDecoration(
            color:  ColorManager.white,
            borderRadius: BorderRadius.circular(8),
            // boxShadow: [
            //   BoxShadow(
            //       color: selected ? Colors.black26 : Colors.transparent,
            //       blurRadius: selected ? 3 : 0,
            //       spreadRadius: selected ? 1 : 0)
            // ],
            border: Border.all(
              color: selected ?  Color(0xFF80368A) : ColorManager.grey5,
              width: 1,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(welcomeText,
                  style: getRegularStyle(color: ColorManager.black3,fontSize: FontSize.s14)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    languageText,
                    style:selected?getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s16): getRegularStyle(color: ColorManager.black3,fontSize: FontSize.s16),
                  ),
                ),
                selected
                    ? CircleAvatar(
                        radius: 13,
                        backgroundColor: ColorManager.primary,
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/auth/auth_notifier.dart';
import 'package:unitey_app/generated/l10n.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';


class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userID = useTextEditingController();
    final password = useTextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final passwordFocus = useFocusNode();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            width: double.infinity,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0, right: 0, child: Image.asset(ImageAssets.bg)
                      ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p18),
                    child: Column(
                      children: [
                        kSizedBox24,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAssets.loginLockIc),
                            kSizedBox12,
                            Text(
                              S.of(context).welcomeBack,
                              style: getRegularStyle(
                                  color: ColorManager.grey,
                                  fontSize: FontSize.s16),
                            ),
                            kSizedBox5,
                            Image.asset(
                              ImageAssets.alGhurairLogo,
                              height: 110.h,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        kSizedBox25,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).customerID,
                                style: getRegularStyle(
                                    color: ColorManager.grey,
                                    fontSize: FontSize.s16)),
                            kSizedBox5,
                            TextFormField(
                              cursorColor: ColorManager.primary,
                              style: getSemiBoldStyle(
                                  color: ColorManager.black3,
                                  fontSize: FontSize.s16),
                              controller: _userID,
                              autovalidateMode:AutovalidateMode.disabled ,
                              keyboardType: TextInputType.emailAddress,
                              onEditingComplete: (){
                                FocusManager.instance.rootScope.requestFocus(passwordFocus);
                              },
                              // textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).plsEnterValue;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: AppPadding.p12),
                                hintText: S.of(context).customerID,
                                focusColor: ColorManager.primary,
                                hintStyle:
                                    getRegularStyle(color: ColorManager.grey4),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: ColorManager.primary),
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            kSizedBox30,
                            Text(S.of(context).enterYourPassword,
                                style: getRegularStyle(
                                    color: ColorManager.grey,
                                    fontSize: FontSize.s16)),
                            kSizedBox8,
                            PinCodeTextField(
                                controller: password,
                                focusNode: passwordFocus,
                                appContext: context,
                                length: 6,
                                obscureText: true,
                                showCursor: false,
autovalidateMode: AutovalidateMode.disabled,
autoDisposeControllers: false,
                                obscuringCharacter: "*",
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                animationType: AnimationType.fade,
                                cursorColor: ColorManager.primary,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(10),
                                  fieldHeight: 54.h,
                                  fieldWidth: 47.w,
                                  activeColor: ColorManager.primary,
                                  inactiveColor: ColorManager.grey5,
                                  selectedColor: ColorManager.primary,
                                  selectedFillColor:ColorManager.filledColor,
                                  inactiveFillColor: ColorManager.filledColor,
                                  activeFillColor:ColorManager.filledColor,
                                ),
                                enableActiveFill: true,
                                onChanged: (value){}),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text(
                              "Forgot password?",
                              style: getRegularStyle(color: ColorManager.grey1),
                            ),
                            onPressed: () =>Navigator.pushNamed(context, forgotPasswordRoute),
                          ),
                        ),
                        kSizedBox71,
                        Column(
                          children: [
                            Consumer<AuthenticationNotifier>(
                                builder: (context, snapshot, child) {
                              return snapshot.getIsLoading
                                  ? const CircularIndicatorWidget()
                                  : GestureDetector(
                                      onTap: () async {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          await snapshot.login(
                                            context: context,
                                            username: _userID.text,
                                            password: password.text,
                                          );

                                        }

                                      },
                                      child: Container(
                                        height: 46.h,
                                        width: 161.w,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              //Color(0xFF7B3884),
                                              //Color(0xffC34BD4),
                                              Color.fromARGB(255, 77, 187, 55),
                                              Color.fromARGB(255, 9, 121, 50),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80),
                                        ),
                                        child: Center(
                                          child: Text(S.of(context).confirm,
                                              style: getSemiBoldStyle(
                                                  color: ColorManager.white,
                                                  fontSize: FontSize.s16)),
                                        ),
                                      ),
                                    );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

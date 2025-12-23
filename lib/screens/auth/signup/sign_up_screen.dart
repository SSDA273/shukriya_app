import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_fetch_notifier.dart';
import 'package:unitey_app/generated/l10n.dart';
import 'package:unitey_app/screens/auth/signup/sign_up_otp_screen.dart';
import 'package:unitey_app/screens/widgets/custom_number_formatter.dart';
import '../../../constant/asset_manager.dart';
import '../../../constant/color_manger.dart';
import '../../../constant/constants.dart';
import '../../../constant/font_manager.dart';
import '../../../constant/style_manager.dart';
import '../../../constant/values_manger.dart';
import '../../../core/notifier/auth/sign_up/emirates_id_notifier.dart';
import '../../../core/notifier/beneficiary/upload_beneficiary_image_notifier.dart';
import '../../../widgets/circular_indicator_widget.dart';

class SignupScreen extends HookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gieomData = Provider.of<GieomFetchNotifier>(context, listen: false);

    final fullNameController =
        useTextEditingController(text: gieomData.getGieomUserName);
    final userNameController =
        useTextEditingController();
    final emiratesController =
        useTextEditingController(text: gieomData.getGieomEmiratesId);
    final dobController = useTextEditingController(text: gieomData.getGieomDOB);
    final nationalityController =
        useTextEditingController(text: gieomData.getGieomNationality);

    final passwordController = useTextEditingController();
    final passwordConfirmController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final image = useState<File?>(null);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0, right: 0, child: Image.asset(ImageAssets.bg)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p2),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                FocusManager.instance.primaryFocus!.unfocus();
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white10,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: ColorManager.black,
                                ),
                              ),
                            ),
                            kSizedW15,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: Color(0xFF7B3884),
                                          fontSize: FontSize.s28),
                                ),
                                // kSizedBox5,
                                // Text(
                                //   "Enter your Details",
                                //   style: Theme.of(context)
                                //       .textTheme
                                //       .titleSmall!
                                //       .copyWith(color: ColorManager.grey1),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        kSizedBox20,
                        Center(
                          child: InkWell(
                            onTap: () {
                              showModel(context, image);
                            },
                            child: SizedBox(
                              height: 85.w,
                              width: 85.w,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 85.w,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFEF6FF),
                                        shape: BoxShape.circle,
                                        image: image.value != null
                                            ? DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  image.value!,
                                                ),
                                              )
                                            : null),
                                    child: image.value != null
                                        ? null
                                        : Icon(
                                            Icons.portrait,
                                            color: ColorManager.primary,
                                          ),
                                  ),
                                  Positioned(
                                    bottom: 3.h,
                                    right: 3.w,
                                    child: Container(
                                      height: 22.h,
                                      width: 22.w,
                                      decoration: BoxDecoration(
                                          color: ColorManager.secondary,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.add,
                                        color: ColorManager.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        kSizedBox15,
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: AppPadding.p12),
                        //   padding: EdgeInsets.symmetric(horizontal: AppPadding.p8,vertical: AppPadding.p12),
                        //   decoration: BoxDecoration(
                        //     // color: ColorManager.grey5,
                        //     borderRadius: BorderRadius.circular(8),
                        //     border: Border.all(color: ColorManager.grey5)
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       Icon(Icons.person,
                        //       color: ColorManager.tertiary,),
                        //       kSizedW12,
                        //       Text(gieomData.getGieomUserName??"")
                        //     ],
                        //   ),
                        // ),
                        GetTextFormField(
                            controller: fullNameController,
                            icon: Icons.person,
                            isEnable: false,
                            inputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              } else if (value.length < 6) {
                                return 'username must be more than 6 characters';
                              }else if(value.length>12){
                                return 'username must be less than 12 characters';
                              }
                              return null;
                            },
                            hintName: 'Full Name'),
                        kSizedBox5,
                        GetTextFormField(
                            controller: emiratesController,
                            icon: Icons.featured_play_list_outlined,
                            inputType: TextInputType.number,
                            isEnable: false,
                            inputFormatters: [
                              EmiratesFormatter(
                                  sample: 'XXX-XXXX-XXXXXXX-X', separator: '-')
                            ],
                            hintName: 'Emirates ID'),
                        // kSizedBox5,
                        // GetTextFormField(
                        //     controller: dobController,
                        //     icon: Icons.date_range,
                        //     inputType: TextInputType.datetime,
                        //     isEnable: false,
                        //     hintName: 'Date of birth'),
                        kSizedBox5,
                        GetTextFormField(
                            controller: nationalityController,
                            icon: Icons.public,
                            inputType: TextInputType.datetime,
                            isEnable: false,
                            hintName: 'Nationality'),
                        kSizedBox5,
                        GetTextFormField(
                            controller: userNameController,
                            icon: Icons.person,
                            inputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter userId';
                              } else if (value.length < 6) {
                                return 'userId must be more than 6 characters';
                              }else if(value.length>12){
                                return 'userId must be less than 12 characters';
                              }
                              return null;
                            },
                            hintName: 'Email Id'),

                        kSizedBox10,
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p34.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Password",
                                  style: getSemiBoldStyle(
                                      color: ColorManager.primary)),
                              kSizedBox8,
                              PinCodeTextField(
                                  controller: passwordController,
                                  appContext: context,
                                  length: 6,
                                  obscureText: true,
                                  showCursor: false,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  autoDisposeControllers: false,
                                  obscuringCharacter: "*",
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).plsEnterValue;
                                    }else if(value.length<6){
                                      return "Enter 6 digit password";
                                    }else{
                                      return null;
                                    }
                                  },
                                  animationType: AnimationType.fade,
                                  cursorColor: ColorManager.primary,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(10),
                                    fieldHeight: 44.h,
                                    fieldWidth: 37.w,
                                    activeColor: ColorManager.primary,
                                    inactiveColor: ColorManager.grey5,
                                    selectedColor: ColorManager.primary,
                                    selectedFillColor: ColorManager.filledColor,
                                    inactiveFillColor: ColorManager.filledColor,
                                    activeFillColor: ColorManager.filledColor,
                                  ),
                                  enableActiveFill: true,
                                  onChanged: (value) {}),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p34.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Confirm Password",
                                  style: getSemiBoldStyle(
                                      color: ColorManager.primary)),
                              kSizedBox8,
                              PinCodeTextField(
                                  controller: passwordConfirmController,
                                  appContext: context,
                                  length: 6,
                                  obscureText: true,
                                  autoDisposeControllers: false,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  validator: (value) {
                                    if (value != passwordController.text) {
                                      return "Enter same as above";
                                    }
                                  },
                                  showCursor: false,
                                  obscuringCharacter: "*",
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(10),
                                    fieldHeight: 44.h,
                                    fieldWidth: 37.w,
                                    activeColor: ColorManager.primary,
                                    inactiveColor: ColorManager.grey5,
                                    selectedColor: ColorManager.primary,
                                    selectedFillColor: ColorManager.filledColor,
                                    inactiveFillColor: ColorManager.filledColor,
                                    activeFillColor: ColorManager.filledColor,
                                  ),
                                  enableActiveFill: true,
                                  onChanged: (value) {}),
                            ],
                          ),
                        ),
                        kSizedBox40,
                        Consumer<EmiratesIdNotifier>(
                            builder: (context, snapshot, _) {
                          return Center(
                            child: snapshot.getIsLoading
                                ? const CircularIndicatorWidget()
                                : GestureDetector(
                                    onTap: () async {

                                      if (formKey.currentState?.validate() ??
                                          false) {
                                        if (image.value == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: const Text(
                                                "Please add your image"),
                                            backgroundColor: ColorManager.red,
                                          ));
                                        } else {
                                          await Provider.of<
                                                      UploadImageNotifier>(
                                                  context,
                                                  listen: false)
                                              .uploadImage(
                                            context: context,
                                            image: image.value!,
                                            type: "customers",
                                          )
                                              .then((value) async {
                                            final data =
                                                await snapshot.emiratesId(
                                                    context: context,
                                                    profileImage:
                                                        value!.result!.key!,
                                                    emiratesId:
                                                        emiratesController.text
                                                            .replaceAll(
                                                                "-", ''),
                                                    userName:
                                                        userNameController.text,
                                                    password: passwordController
                                                        .text);
                                            if (data == "ok") {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => SignUpOTPScreen(
                                                          emiratesId:
                                                              emiratesController
                                                                  .text,
                                                          userName:
                                                              fullNameController
                                                                  .text,
                                                          password:
                                                              passwordController
                                                                  .text,
                                                          profileImage: value
                                                              .result!.key!),
                                                ),
                                              );
                                            }
                                          });
                                        }
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
                                              Color(0xFF7B3884),
                                              Color(0xffC34BD4),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(80),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Confirm",
                                          style: getSemiBoldStyle(
                                              color: ColorManager.white,
                                              fontSize: FontSize.s16),
                                        ))),
                                  ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImage(
      ImageSource source, ValueNotifier image, BuildContext context) async {
    try {
      final XFile? pickedImageFile = await ImagePicker().pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 20,
      );
      if (pickedImageFile == null) return;
      final File imageTemporary = File(pickedImageFile.path);
      image.value = imageTemporary;
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print("Failed to pick Image $e");
    }
  }

  Future showModel(BuildContext context, ValueNotifier image) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 214.h,
            child: Column(
              children: [
                kSizedBox15,
                Container(
                  height: 4.h,
                  width: 42.w,
                  decoration: BoxDecoration(color: ColorManager.grey4),
                ),
                kSizedBox25,
                InkWell(
                  onTap: () => _pickImage(ImageSource.camera, image, context),
                  child: Container(
                    height: 57,
                    width: 328.w,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.grey5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: ColorManager.primary,
                        ),
                        kSizedW15,
                        Text(
                          "Open Camera",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Color(0xFF333333)),
                        ),
                        // Spacer(),
                        // Icon(
                        //   Icons.check_circle,
                        //   color: ColorManager.primary,
                        // )
                      ],
                    ),
                  ),
                ),
                kSizedBox18,
                InkWell(
                  onTap: () => _pickImage(ImageSource.gallery, image, context),
                  child: Container(
                    height: 57,
                    width: 328.w,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.grey5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.image_sharp,
                          color: ColorManager.primary,
                        ),

                        kSizedW15,
                        Text(
                          "Open Gallery",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Color(0xFF333333)),
                        ),
                        // Spacer(),
                        // Icon(Icons.check_circle,
                        // color: ColorManager.primary,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class GetTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintName;
  final IconData icon;
  final bool isObscureText;
  final int? maxLength;
  final TextInputType inputType;
  final bool isEnable, isEditable;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const GetTextFormField(
      {required this.controller,
      required this.hintName,
      required this.icon,
      this.validator,
      this.isEditable = true,
      this.maxLength,
      this.inputFormatters,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      this.isEnable = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        enabled: isEnable,
        style: getSemiBoldStyle(color: ColorManager.black),
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${hintName}';
              }
              return null;
            },
        autocorrect: isEditable,
        enableSuggestions: isEditable,
        enableInteractiveSelection: isEditable,
        maxLength: maxLength,
        decoration: InputDecoration(
          floatingLabelStyle: getSemiBoldStyle(color: ColorManager.primary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: ColorManager.grey5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: ColorManager.grey5),
          ),

          prefixIcon: Icon(
            icon,
            color: ColorManager.tertiary,
          ),

          // hintText: hintName,
          labelText: hintName,
          labelStyle: getRegularStyle(color: ColorManager.black3),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}


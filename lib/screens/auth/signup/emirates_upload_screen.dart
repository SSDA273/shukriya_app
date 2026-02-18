import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/gieom/get_gieom_instruction_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_fetch_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_process_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_token_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_upload_back_notifier.dart';
import 'package:unitey_app/core/notifier/gieom/gieom_upload_front_notifier.dart';
import 'package:unitey_app/screens/auth/signup/verification_info_screen.dart';
import 'package:unitey_app/widgets/button_widget.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';
import '../../../constant/asset_manager.dart';
import '../../../constant/font_manager.dart';
import '../../../core/notifier/beneficiary/upload_beneficiary_image_notifier.dart';

class EmiratesUploadScreen extends StatefulWidget {
  const EmiratesUploadScreen({Key? key}) : super(key: key);

  @override
  State<EmiratesUploadScreen> createState() => _EmiratesUploadScreenState();
}

class _EmiratesUploadScreenState extends State<EmiratesUploadScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }

  _asyncMethod() async {
    showDialog(
        context: context, builder: (context){
      return const CircularIndicatorWidget();
    });
    await context
        .read<GieomTokenNotifier>()
        .generateGieomToken(context: context)
        .catchError((error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to initialize verification: $error"),
            backgroundColor: ColorManager.red,
          ),
        );
      }
    })
        .then((_) {
      if (mounted) Navigator.pop(context);
    });
  }

  File? frontImage;
  File? backImage;
  bool isFrontLoading = false;
  bool isBackLoading = false;

  Future pickFrontImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source,imageQuality: 40);
      if (image == null) return;

      final imageTemporary = File(image.path);
      final imageForUpload = File(image.path).readAsBytesSync();
      Navigator.pop(context);
      setState((){
        isFrontLoading =true;
      });
      await context.read<GieomUploadFrontNotifier>().uploadFrontImage(
          context: context, base64Image: base64Encode(imageForUpload));
      setState((){
        isFrontLoading =false;
      });
      setState(() => frontImage = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick Image : $e");
    }
  }

  Future pickBackImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source,imageQuality: 40);
      if (image == null) return;

      final imageTemporary = File(image.path);
      final imageForUpload = File(image.path).readAsBytesSync();
      Navigator.pop(context);
      setState((){
        isBackLoading =true;
      });
      await context.read<GieomUploadBackNotifier>().uploadBackImage(
          context: context, base64Image: base64Encode(imageForUpload));
      setState((){
        isBackLoading =false;
      });
      setState(() => backImage = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick Image : $e");
    }
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final fileUpload = Provider.of<UploadImageNotifier>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0, right: 0, child: Image.asset(ImageAssets.bg)),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p16, horizontal: AppPadding.p16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            kSizedBox5,
                            Text(
                              "Upload your Emirates ID",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ColorManager.grey1),
                            ),
                          ],
                        ),
                        Consumer<GieomTokenNotifier>(
                          builder: (context, tokenData, _) {
                            if (tokenData.getGieomToken == null && !tokenData.isLoading) {
                              return IconButton(
                                icon: Icon(Icons.refresh, color: ColorManager.primary),
                                onPressed: () => _asyncMethod(),
                                tooltip: "Retry initialization",
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                      ],
                    ),
                    kSizedBox25,
                    DottedBorder(
                        color: ColorManager.grey4,
                        strokeWidth: 2,
                        dashPattern: const [10, 9],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(24),
                        child: InkWell(
                          onTap: showFrontModel,
                          child: Container(
                            height: 157.h,
                            padding: EdgeInsets.symmetric(
                                vertical: frontImage != null
                                    ? AppPadding.p6.h
                                    : AppPadding.p24.h,
                                horizontal: frontImage != null
                                    ? AppPadding.p6.h
                                    : AppPadding.p12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: frontImage != null
                                    ? null
                                    : const Color(0xFFFD5BAA)
                                        .withOpacity(0.08)),
                            child:isFrontLoading?const CircularIndicatorWidget(): frontImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.file(
                                      frontImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Column(
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.uploadIc,
                                      ),
                                      kSizedBox16,
                                      Text(
                                        "Upload the front of your ID",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: ColorManager.tertiary),
                                      ),
                                      Text(
                                        "Max File Size: 20MB",
                                        style: getRegularStyle(
                                            color: Color(0xFF9F97A0),
                                            fontSize: FontSize.s14),
                                      )
                                    ],
                                  ),
                          ),
                        )),
                    kSizedBox20,
                    DottedBorder(
                        color: ColorManager.grey4,
                        strokeWidth: 2,
                        dashPattern: const [10, 9],
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(24),
                        child: InkWell(
                          onTap: showBackModel,
                          child: Container(
                            height: 157.h,
                            padding: EdgeInsets.symmetric(
                                vertical: backImage != null
                                    ? AppPadding.p6.h
                                    : AppPadding.p24.h,
                                horizontal: backImage != null
                                    ? AppPadding.p6.h
                                    : AppPadding.p12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: backImage != null
                                    ? null
                                    : Color(0xFFFD5BAA).withOpacity(0.08)),
                            child: isBackLoading?const CircularIndicatorWidget():backImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.file(
                                      backImage!,
                                      fit: BoxFit.cover,
                                    ))
                                : Column(
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.uploadIc,
                                      ),
                                      kSizedBox16,
                                      Text(
                                        "Upload the back of your ID",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: ColorManager.tertiary),
                                      ),
                                      Text(
                                        "Max File Size: 20MB",
                                        style: getRegularStyle(
                                            color: Color(0xFF9F97A0),
                                            fontSize: FontSize.s14),
                                      )
                                    ],
                                  ),
                          ),
                        )),
                    kSizedBox18,
                    Center(
                      child: _isLoading
                          ? Column(
                              children: [
                                 CircularIndicatorWidget(),
                                kSizedBox5,
                                Text(
                                    "Please wait unlit the processing finish..")
                              ],
                            )
                          : ButtonWidget(
                              // onPressed: ()async {
                              //   await context.read<GetGieomInstructionNotifier>()
                              //       .getDetails(context: context);
                              //   Navigator.push(context, MaterialPageRoute(
                              //       builder: (context) =>
                              //           VerificationInfoScreen()));
                              // },
                              onPressed: () async {
                                // context
                                //     .read<GetGieomInstructionNotifier>()
                                //     .getDetails(context: context)
                                //     .then((_) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               const VerificationInfoScreen()));
                                // });
                                if(frontImage !=null && backImage !=null){
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  try {
                                    await Provider.of<GieomProcessNotifier>(context, listen: false).processGieom(context: context);
                                    await Provider.of<GieomFetchNotifier>(context, listen: false).getDetails(context: context);
                                    await context.read<GetGieomInstructionNotifier>().getDetails(context: context);
                                    
                                    if (mounted) {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => const VerificationInfoScreen()));
                                    }
                                  } catch (e) {
                                    if (mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Error: $e"),
                                          backgroundColor: ColorManager.red,
                                        ),
                                      );
                                    }
                                  } finally {
                                    if (mounted) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  }
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please upload two side of your emirates id"),backgroundColor: ColorManager.red,));
                                }
                              },
                              text: "Confirm"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showFrontModel() {
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
                  onTap: () => pickFrontImage(ImageSource.camera),
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
                        SvgPicture.asset(ImageAssets.scan),
                        kSizedW15,
                        Text(
                          "Scan to upload your ID",
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
                  onTap: () => pickFrontImage(ImageSource.gallery),
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
                        SvgPicture.asset(ImageAssets.upload),
                        kSizedW15,
                        Text(
                          "Upload from the gallery",
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

  Future showBackModel() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
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
                  onTap: () => pickBackImage(ImageSource.camera),
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
                        SvgPicture.asset(ImageAssets.scan),
                        kSizedW15,
                        Text(
                          "Scan to upload your ID",
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
                  onTap: () => pickBackImage(ImageSource.gallery),
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
                        SvgPicture.asset(ImageAssets.upload),
                        kSizedW15,
                        Text(
                          "Upload from the gallery",
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

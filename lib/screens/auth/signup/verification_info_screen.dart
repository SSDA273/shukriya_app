import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/widgets/button_widget.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';

import '../../../core/notifier/gieom/gieom_face_match_notifier.dart';
import '../../../core/notifier/gieom/gieom_liveness_notifier.dart';
import 'camera_screen.dart';
import 'sign_up_screen.dart';
import 'face_match_camera.dart';

class VerificationInfoScreen extends HookWidget {
  const VerificationInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonText = useState<String>("Next");
    final liveness = useState<String>("");
    final faceMatch = useState<String>("");
    final isLoading = useState<bool>(false);
    final videoFile = useState<XFile?>(null);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppBar(),
                kSizedBox25,
                videoFile.value == null
                    ? SizedBox(
                        height: 150,
                        child: Image.network(
                            "https://thumbs.dreamstime.com/b/id-card-icon-vector-identity-tag-vector-illustration-symbol-driver-licence-logo-id-card-icon-vector-identity-tag-vector-152536266.jpg"))
                    : Column(
                        children: [
                          Icon(
                            (liveness.value == 'Success' &&
                                    faceMatch.value == 'Success')
                                ? Icons.verified_user
                                : Icons.security,
                            size: 150,
                            color: (liveness.value == 'Success' &&
                                    faceMatch.value == 'Success')
                                ? Colors.green
                                : ColorManager.primary,
                          ),
                          kSizedBox10,
                          Text(
                            (liveness.value == 'Success' &&
                                    faceMatch.value == 'Success')
                                ? "Verification Completed"
                                : "Verifying Identity...",
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s24),
                          )
                        ],
                      ),
                kSizedBox25,
                videoFile.value == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID Verification",
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s24),
                          ),
                          kSizedBox10,
                          Text(
                            "On the next screen, we will ask you to upload a real-time video that can be verified against the photo on your Emirates ID.",
                            style: getRegularStyle(
                                color: ColorManager.grey3,
                                fontSize: FontSize.s14),
                            textAlign: TextAlign.justify,
                          ),
                          kSizedBox25,
                          Text(
                            "Note:",
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s18),
                          ),
                          kSizedBox5,
                          Text(
                            "• Instruction will appear on the top of the screen.",
                            style: getRegularStyle(
                                color: ColorManager.grey3,
                                fontSize: FontSize.s14),
                            textAlign: TextAlign.justify,
                          ),
                          kSizedBox5,
                          Text(
                            "• Please stand facing a light source.",
                            style: getRegularStyle(
                                color: ColorManager.grey3,
                                fontSize: FontSize.s14),
                            textAlign: TextAlign.justify,
                          ),
                          kSizedBox5,
                          Text(
                            "• Recording will automatically dispose after 15 sec.",
                            style: getRegularStyle(
                                color: ColorManager.grey3,
                                fontSize: FontSize.s14),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Emirates Id",
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s20),
                              ),
                              kSizedW5,
                              const Icon(
                                Icons.verified,
                                color: Colors.green,
                              ),
                            ],
                          ),
                          kSizedBox15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Liveness Test",
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s20),
                              ),
                              kSizedW5,
                              liveness.value == 'Success'
                                  ? const Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                    )
                                  : Icon(Icons.pending,
                                      color: ColorManager.red),
                            ],
                          ),
                          kSizedBox15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Face Match",
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s20),
                              ),
                              kSizedW5,
                              faceMatch.value == 'Success'
                                  ? const Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                    )
                                  : Icon(Icons.gpp_bad,
                                      color: ColorManager.red),
                            ],
                          ),
                        ],
                      ),
                kSizedBox71,
                isLoading.value
                    ? const CircularIndicatorWidget()
                    : ButtonWidget(
                        //if video file is empty and liveness is not success
                        onPressed: videoFile.value == null ||
                                liveness.value != 'Success'
                            ? () async {
                                videoFile.value = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CameraScreen()));
                                if (videoFile.value != null) {
                                  isLoading.value = true;
                                  buttonText.value = "Next";
                                  await context
                                      .read<GieomLivenessNotifier>()
                                      .checkLiveness(
                                          context: context,
                                          isIos: Platform.isIOS,
                                          video: videoFile.value!)
                                      .then((value) {
                                    if (value != null) {
                                      isLoading.value = false;
                                      liveness.value = 'Success';
                                    } else {
                                      //Todo: remove when testing finish
                                      // liveness.value = 'Success';
                                      // buttonText.value = "Next";
                                      // isLoading.value = false;

                                      buttonText.value = "Retry";
                                      isLoading.value =false;
                                    }
                                  });
                                }
                              }
                            : liveness.value == 'Success' &&
                                    faceMatch.value != 'Success'
                                ? () async {
                                    await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FaceMatchCamera()))
                                        .then((value) async {
                                      if (value != null) {
                                        isLoading.value = true;
                                        final imageForUpload =
                                            File(value.path).readAsBytesSync();
                                        await context
                                            .read<GieomFaceMatchNotifier>()
                                            .checkFaceMatch(
                                                context: context,
                                                image: base64Encode(
                                                    imageForUpload))
                                            .then((response) {
                                          if (response != null) {
                                            isLoading.value = false;
                                            faceMatch.value = 'Success';
                                            buttonText.value = "Next";
                                          } else {
                                            buttonText.value = "Retry";
                                            isLoading.value = false;
                                          }
                                        });
                                      }
                                    });
                                  }
                                : faceMatch.value == 'Success'
                                    ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignupScreen()));
                                      }
                                    : () {
                                        print("Liveness ReTesting");
                                      },
                        text: buttonText.value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Color(0xFF7B3884), fontSize: FontSize.s28),
            ),
            kSizedBox5,
            Text(
              "ID Verification",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorManager.grey1),
            ),
          ],
        ),
      ],
    );
  }
}

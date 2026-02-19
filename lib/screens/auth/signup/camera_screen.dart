import 'dart:async';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/core/notifier/gieom/get_gieom_instruction_notifier.dart';
import '../../../main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  int secondsRemaining = 0;
  bool isVideoStart = false;
  late Timer timer;
  XFile? videoFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // timer.cancel();
    controller.dispose();
    super.dispose();
  }

  Map<String, List<int>> data = {
    "eye-blinks": [2],
    "head-left-tilt": [6],
    "head-right-tilt": [10]
  };
  List newData = [];

  // [{
  //   "time":2,
  //  "event":"eye-blink",
  //  },
  //  {
  //  "time":2,
  //  "event":"eye-blink",
  //  }]

  String message = "Message Will Display Here";

  @override
  Widget build(BuildContext context) {
    final gieomInstruction =
        Provider.of<GetGieomInstructionNotifier>(context, listen: false).getGieomInstruction;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
              decoration: BoxDecoration(color: ColorManager.primary),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () async {
                        if (isVideoStart) {
                          timer.cancel();
                          await stopVideoRecording();
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "BACK",
                          style: getSemiBoldStyle(color: ColorManager.white),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isVideoStart ? message : "Ready to Start",
                          style: getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: isVideoStart ? FontSize.s22 : FontSize.s18),
                        ),
                        if (isVideoStart) kSizedBox5,
                        if (isVideoStart)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                                color: ColorManager.red,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              "00:${secondsRemaining.toString().padLeft(2, '0')}",
                              style:
                                  getSemiBoldStyle(color: ColorManager.white),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                child: CameraPreview(
                  controller,
                  child: isVideoStart
                      ? null
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                ),
              ),
            ),
            kSizedBox20,
            isVideoStart
                ? message == "Eye Blink"
                    ? Lottie.asset("assets/json/eye.json", height: 140.h)
                    : message == "Move Head Right"
                        ? Lottie.asset("assets/json/face.json", height: 140.h)
                        : message == "Move Head Left"
                            ? Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Lottie.asset("assets/json/face.json",
                                    height: 140.h),
                              )
                            : kSizedBox71
                : kSizedBox,
            Container(
              height: 80.h,
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              decoration: BoxDecoration(color: ColorManager.primary),
              child: Center(
                child: isVideoStart
                    ? const SizedBox.shrink()
                    : InkWell(
                        onTap: () async {
                          if (isVideoStart == false) {
                            startVideoRecording();
                            setState(() {
                              isVideoStart = true;
                              secondsRemaining = 0;
                              message = "Steady...";
                            });

                            // Prepare instructions
                            newData = [];
                            if (gieomInstruction != null) {
                              gieomInstruction.forEach((key, value) {
                                for (var element in value) {
                                  newData.add({
                                    "time": int.parse(element),
                                    "event": key
                                  });
                                }
                              });
                              newData.sort(
                                  (a, b) => a["time"].compareTo(b["time"]));
                            }

                            timer = Timer.periodic(const Duration(seconds: 1),
                                (_) async {
                              if (secondsRemaining < 15) {
                                setState(() {
                                  secondsRemaining++;
                                });

                                // Check for matches at the current time
                                final matches = newData
                                    .where((e) => e['time'] == secondsRemaining)
                                    .toList();

                                if (matches.isNotEmpty) {
                                  final element = matches.first;
                                  print(
                                      "Instruction triggered: ${element['event']} at $secondsRemaining");
                                  setState(() {
                                    if (element['event'] == 'eye-blinks') {
                                      message = "Eye Blink";
                                    } else if (element['event'] ==
                                        'head-left-tilt') {
                                      message = "Move Head Left";
                                    } else if (element['event'] ==
                                        'head-right-tilt') {
                                      message = "Move Head Right";
                                    }
                                  });
                                }
                              } else {
                                timer.cancel();
                                await stopVideoRecording().then((value) {
                                  videoFile = value;
                                  Navigator.pop(context, videoFile);
                                });
                              }
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p8,
                              horizontal: AppPadding.p12),
                          decoration: BoxDecoration(
                            color: ColorManager.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.videocam_outlined,
                                size: 32,
                                color: ColorManager.white,
                              ),
                              kSizedW10,
                              Text(
                                "START",
                                style: getSemiBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s14),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> startVideoRecording() async {
    final CameraController cameraController = controller;

    if (!cameraController.value.isInitialized) {
      print('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      // A recording is already started, do nothing.
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController cameraController = controller;

    if (!cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.pauseVideoRecording();
    } on CameraException catch (e) {
      print(e);
      rethrow;
    }
  }
}

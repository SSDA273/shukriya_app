import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';

import '../../../main.dart';

class NewCameraScreen extends StatefulWidget {
  const NewCameraScreen({Key? key}) : super(key: key);

  @override
  State<NewCameraScreen> createState() => _NewCameraScreenState();
}

class _NewCameraScreenState extends State<NewCameraScreen> {
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

  var data = {
    "eye-blinks": ["7", "10", "13"],
    "head-left-tilt": ["2", "8"],
    "head-right-tilt": ["5", "15"]
  };

  String message = "Message Display Here";

  @override
  Widget build(BuildContext context) {
    print(data['eye-blinks']);
    return Scaffold(
      // backgroundColor: ColorManager.primary,
      body: Stack(
        children: [

          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: CameraPreview(
              controller,
              child:isVideoStart?null: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 70.h),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(4),
                      //   decoration: BoxDecoration(
                      //       color: ColorManager.white,
                      //       borderRadius: BorderRadius.circular(10)
                      //   ),
                      //   child: Icon(Icons.c,size: 26,
                      //     color: ColorManager.black,),),
                      kSizedW15,
                      InkWell(
                        onTap: () async {
                          if (isVideoStart == false) {
                            startVideoRecording();
                            setState(() {
                              isVideoStart = true;
                            });
                            timer = Timer.periodic(
                                const Duration(seconds: 1), (_) async {
                              if (secondsRemaining != 30) {
                                setState(() {
                                  secondsRemaining++;
                                });
                                for (var element in data['eye-blinks']!) {
                                  if (secondsRemaining.toString() ==
                                      element) {
                                    message = "Eye Blink";
                                  }
                                }
                                for (var element
                                in data['head-left-tilt']!) {
                                  if (secondsRemaining.toString() ==
                                      element) {
                                    message = "Move Head Left";
                                  }
                                }
                                for (var element
                                in data['head-right-tilt']!) {
                                  if (secondsRemaining.toString() ==
                                      element) {
                                    message = "Move Head Right";
                                  }
                                }
                              } else {
                                timer.cancel();
                                videoFile = await stopVideoRecording();
                                Navigator.pop(context, videoFile);

                                // setState(() {
                                //   isVideoStart = false;
                                // });
                              }
                            });
                          } else {
                            print("sss");
                          }
                          // controller.startVideoRecording();
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: ColorManager.red,
                              borderRadius: BorderRadius.circular(30),),
                          child: Row(
                            children: [
                              Icon(
                                isVideoStart
                                    ? Icons.fiber_manual_record_outlined
                                    : Icons.videocam_outlined,
                                size: 32,
                                color: ColorManager.white,
                              ),
                              kSizedW10,
                              Text("Start Recording",
                                style: getSemiBoldStyle(
                                    color: ColorManager.white, fontSize: FontSize.s14),)
                            ],
                          ),
                        ),
                      ),
                      kSizedW15,
                      // Container(
                      //   padding: EdgeInsets.all(4),
                      //   decoration: BoxDecoration(
                      //       color: ColorManager.white,
                      //       borderRadius: BorderRadius.circular(10)
                      //   ),
                      //   child: Icon(Icons.info_outline,size: 26,
                      //     color: ColorManager.black,),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [ColorManager.primary, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: ()async{
                  if (isVideoStart) {
                    timer.cancel();
                    await stopVideoRecording();
                    Navigator.pop(context);
                  }else{
                    Navigator.pop(context);
                  }
                }, icon: Icon(Icons.close,
                  size: 30,
                  color: ColorManager.white,)),
                kSizedW30,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: getSemiBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s20),
                    ),
                    kSizedBox10,
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color:  ColorManager.red,
                          // color: isVideoStart
                          //     ? ColorManager.red
                          //     : Colors.transparent,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "00:${secondsRemaining}",
                        style: getSemiBoldStyle(color: ColorManager.white),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,

            child: Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ColorManager.primary, Colors.white10],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
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
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
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

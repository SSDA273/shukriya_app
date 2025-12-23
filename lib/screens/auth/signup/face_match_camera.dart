import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manger.dart';
import '../../../constant/constants.dart';
import '../../../constant/font_manager.dart';
import '../../../constant/style_manager.dart';
import '../../../constant/values_manger.dart';
import '../../../main.dart';

class FaceMatchCamera extends StatefulWidget {
  const FaceMatchCamera({Key? key}) : super(key: key);

  @override
  State<FaceMatchCamera> createState() => _FaceMatchCameraState();
}

class _FaceMatchCameraState extends State<FaceMatchCamera> {
  late CameraController controller;

  int secondsRemaining = 0;
  bool isVideoStart = false;
  XFile? imageFile;

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



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p24),
              decoration: BoxDecoration(color: ColorManager.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                        Navigator.pop(context);
                    },
                    child: Text(
                      "BACK",
                      style: getSemiBoldStyle(color: ColorManager.white),
                    ),
                  ),
                 imageFile!=null? InkWell(
                    onTap: () async {
                      Navigator.pop(context,imageFile);
                    },
                    child: Text(
                      "Done",
                      style: getSemiBoldStyle(color: ColorManager.white,),
                    ),
                  ):kSizedBox,

                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.all(Radius.circular(22)),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
              ),
              child: CameraPreview(
                controller,
                child:  Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    // padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
            kSizedBox20,

            Container(
              height: 80.h,
              padding:const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              decoration: BoxDecoration(color: ColorManager.primary),
              child: Center(
                child: InkWell(
                  onTap: () async {

                    controller.takePicture().then((value){
                      setState((){
                        imageFile = value;
                      });

                    });
                  },
                  child: Container(
                    padding:const EdgeInsets.symmetric(
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
                          Icons.photo_camera_outlined,
                          size: 32,
                          color: ColorManager.white,
                        ),
                        kSizedW10,
                        Text(
                          "Take Selfi",
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
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image:imageFile !=null? DecorationImage(
              image: FileImage(File(imageFile!.path),),
              fit: BoxFit.cover
            ):null
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


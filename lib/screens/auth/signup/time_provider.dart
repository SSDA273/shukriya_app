import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class TimeProvider extends ChangeNotifier {
  late CameraController controller;
  late Timer timer;
  bool isVideoStart = false;
  int secondsRemaining = 0;
  XFile? videoFile;
  Map<String, List<int>> data = {
    "eye-blinks": [2, 6, 11],
    "head-left-tilt": [4, 14],
    "head-right-tilt": [8, 12]
  };
  List newData = [];

  String message = "Message will appear here";

  void initStage(){
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      notifyListeners();
    });
  }

  void startTimer() {
    isVideoStart = true;
    notifyListeners();

    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (secondsRemaining != 15) {
        secondsRemaining++;
        notifyListeners();
        newData = [];
        data.forEach((key, value) {
          for (var element in value) {
            newData.add({"time": element, "event": key});
          }
        });
        newData.sort((a, b) => a["time"].compareTo(b["time"]));
        for (var element in newData) {
          if (element['time'] == secondsRemaining) {
            print("First");
            if (element['event'] == 'eye-blinks') {
              message = "Eye Blink";
              notifyListeners();
            } else if (element['event'] == 'head-left-tilt') {
              message = "Move Head Left";
              notifyListeners();
            } else {
              message = "Move Head Right";
              notifyListeners();
            }
          }else {
            message = "Mn";
            notifyListeners();
          }
        }

      } else {
        timer.cancel();
        videoFile = await stopVideoRecording();

        Navigator.pop( navigatorKey.currentContext!, videoFile);

        // setState(() {
        //   isVideoStart = false;
        // });
      }
    });
  }

  Future<void> stopTimer()async {
    isVideoStart = false;
    secondsRemaining =0;
    timer.cancel();
    await stopVideoRecording();
    notifyListeners();
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
}

import 'dart:async';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:soid_mobile/app/misc/constants.dart';

List<CameraDescription>? camerasList;

class CameraView extends StatefulWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late Size size = MediaQuery.of(context).size;
  CameraController? controller;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  void initCamera() async {
    camerasList = await availableCameras();
    controller = CameraController(
      camerasList!.first,
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
      enableAudio: false,
    );

    await controller?.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    await controller?.setFlashMode(FlashMode.off);

    if (cameraController == null || !cameraController.value.isInitialized) {}

    if (cameraController!.value.isTakingPicture) {
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        Navigator.of(context).pop(file);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    }
    return Stack(fit: StackFit.expand, children: [
      CameraPreview(
        controller!,
      ),
      cameraOverlay(padding: 50, aspectRatio: 1.5),
      Positioned(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close,
            color: AppConstants.COLOR_WHITE,
            size: 30.0,
          ),
        ),
        top: 30.0,
        left: 10.0,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(bottom: 24),
          child: GestureDetector(
            onTap: () {
              onTakePictureButtonPressed();
            },
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Color.fromRGBO(207, 216, 220, 1),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  width: 7,
                  color: AppConstants.COLOR_WHITE,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        child: Container(
          child: Text(
            "Pastikan foto Kartu Identitas customer\nberada di dalam frame di atas",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MMC',
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
              color: AppConstants.COLOR_WHITE,
              fontSize: AppConstants.TEXT_SIZE_14,
            ),
          ),
        ),
        bottom: MediaQuery.of(context).size.height / 4,
        left: 70 * MediaQuery.of(context).size.width / 360,
      ),
    ]);
  }

  Widget cameraOverlay({required double padding, required double aspectRatio}) {
    return LayoutBuilder(builder: (context, constraints) {
      double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
      double verticalPadding;

      if (parentAspectRatio < aspectRatio) {
        verticalPadding = (constraints.maxHeight -
                ((constraints.maxWidth - padding) / aspectRatio)) /
            2;
      } else {
        verticalPadding = padding;
      }
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 17, vertical: verticalPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: AppConstants.COLOR_WHITE)),
      );
    });
  }
}

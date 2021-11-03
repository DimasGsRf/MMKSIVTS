import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sfid_mobile/app/misc/constants.dart';

class QrCodeScanner extends StatefulWidget {
  final double scanArea;
  final Function() onBackPressed;
  final Function(String) onSuccessScan;
  final List<BarcodeFormat>? formatsAllowed;
  final PermissionSetCallback? onPermissionSet;

  const QrCodeScanner({
    required this.onSuccessScan,
    required this.onBackPressed,
    this.scanArea = 250.0,
    this.onPermissionSet,
    this.formatsAllowed,
    Key? key,
  }) : super(key: key);

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  late final qrKey = GlobalKey(debugLabel: 'QR_CODE');
  late QRViewController? qrController;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  late Size size = MediaQuery.of(context).size;
  late double scaleWidth = size.width / 360;

  bool isFlashOn = false;

  void toggleFlash() {
    qrController?.toggleFlash().then((_) {
      setState(() {
        isFlashOn = !isFlashOn;
      });
    });
  }

  void toggleCamera() {
    qrController?.flipCamera().then((_) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: QRView(
            key: qrKey,
            formatsAllowed: widget.formatsAllowed ?? [BarcodeFormat.code128],
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: AppConstants.COLOR_RED,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: widget.scanArea,
            ),
            onPermissionSet: widget.onPermissionSet,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: 20,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: widget.onBackPressed,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: isFlashOn
                        ? Icon(Icons.flash_on)
                        : Icon(Icons.flash_off),
                    onPressed: toggleFlash,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                top: size.height * 0.05,
                right: 20,
              ),
              child: IconButton(
                icon: Icon(CupertinoIcons.camera_rotate),
                onPressed: toggleCamera,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    qrController?.scannedDataStream.listen((barcode) {
      widget.onSuccessScan(barcode.code);
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }
}

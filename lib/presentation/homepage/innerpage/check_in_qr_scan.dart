import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/preferences.dart';
import 'package:flutter_app/presentation/bloc/params_bloc.dart';
import 'package:flutter_app/presentation/bloc/params_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vrouter/vrouter.dart';

import '../../../models/login_model.dart';
import 'eventpage.dart';

class CheckInQRScan extends StatefulWidget {
  static String id = "checkInQRScan";
  static String path = "${EventPage.path}/$id";
  final String eventName;
  CheckInQRScan({Key? key, required this.eventName}) : super(key: key);

  @override
  _CheckInQRScanState createState() => _CheckInQRScanState();
}

class _CheckInQRScanState extends State<CheckInQRScan> {
  // Barcode? result;
  // QRViewController? controller;
  // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  LoginModel? loginModel;

  @override
  void reassemble() {
    super.reassemble();
    // if (Platform.isAndroid) {
    //   controller!.pauseCamera();
    // }
    // controller!.resumeCamera();
    //   getProfileData();
  }

  getProfileData() async {
    final _pref = await Preferences.getInstance();
    loginModel = await _pref.getToken();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //TODO Temp purpose only
    /*BlocProvider.of<ParamsBloc>(context).add(SetQRScanValue(Barcode("vaapglkns", BarcodeFormat.aztec, null)));
    Navigator.pop(context);*/

    getProfileData();
    return Stack(
      children: [
        _buildQrView(context),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: IconButton(
            onPressed: () {
              VRouter.of(context).pop();
            },
            icon: Icon(
              Icons.close,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 80.0, left: 70, right: 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Name : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      loginModel?.f_name ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "BKMS ID : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      loginModel?.bkms_id.toString() ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Event Name : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.eventName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildQrView(BuildContext context) {
    // // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var scanArea =
    //     (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;
    // // To ensure the Scanner view is properly sizes after rotation
    // // we need to listen for Flutter SizeChanged notification and update controller
    // return QRView(
    //   key: qrKey,
    //   onQRViewCreated: _onQRViewCreated,
    //   overlay: QrScannerOverlayShape(
    //       borderColor: Colors.red, borderRadius: 10, borderLength: 30, borderWidth: 10, cutOutSize: scanArea),
    //   onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    // );
    return Center(
      child: QrImage(
        data: "15",
        size: 300,
        version: QrVersions.auto,
        gapless: false,
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     this.controller = controller;
  //   });
  //   controller.scannedDataStream.listen((scanData) {
  //     /* setState(() {
  //       result = scanData;
  //     });*/
  //
  //     //FOR RETURN SCAN CAPTURE DATA
  //     BlocProvider.of<ParamsBloc>(context).add(SetQRScanValue(scanData));
  //     VRouter.of(context).pop();
  //   });
  // }
  //
  // void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
  //   log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
  //   if (!p) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('no Permission')),
  //     );
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   controller?.dispose();
  //   super.dispose();
  // }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  static const String idScreen = "QRCodeScanner";

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result.format)}   Data: ${MerchantProfile(result.code)}')
                  : Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  String MerchantProfile(context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;
    DatabaseReference merchantsprofileRef =
        FirebaseDatabase.instance.reference().child("users").child(uid);
    final yid = context;
    String id = context;
    DatabaseReference usersprofileRef =
        FirebaseDatabase.instance.reference().child("merchantusers").child(yid);

    DatabaseReference referencemerchantData =
        FirebaseDatabase.instance.reference().child("merchantusers").child(id);
    DatabaseReference referenceuserData =
        FirebaseDatabase.instance.reference().child("users").child(uid);

    referencemerchantData.once().then((DataSnapshot dataSnapShot) {
      String data1 = dataSnapShot.value["name"];
      String data2 = dataSnapShot.value["shopname"];
      String data3 = dataSnapShot.value["phonenumber"];

      Map merchantDataMap = {
        "name": data1.trim(),
        "shopname": data2.trim(),
        "phonenumber": data3.trim()
      };
      merchantsprofileRef
          .child("merchantusers")
          .child(yid)
          .set(merchantDataMap);
    });
    referenceuserData.once().then((DataSnapshot dataSnapShot) {
      String data1 = dataSnapShot.value["name"];
      String data2 = dataSnapShot.value["phonenumber"];
      String data3 = dataSnapShot.value["pincode"];
      String data4 = dataSnapShot.value["Vaccinated"];

      Map userDataMap = {
        "name": data1.trim(),
        "phonenumber": data2.trim(),
        "pincode": data3.trim(),
        "Vaccinated": data4.trim()
      };
      usersprofileRef.child("users").child(uid).set(userDataMap);
    });
  }
}

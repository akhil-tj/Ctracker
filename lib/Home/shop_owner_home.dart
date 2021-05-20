import 'package:ctracker/style/color.dart';
import 'package:ctracker/style/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ShopOwnerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShopOwnerHomeBody(),
    );
  }
}

FirebaseAuth auth = FirebaseAuth.instance;

String printID() {
  User user = auth.currentUser;
  String id = user.uid;
  String data = id;
  return data;
}

class ShopOwnerHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(
              //backgroundColor: Colors.white,
              radius: 23.0,
              backgroundImage: AssetImage('assets/Ellipse 2.png'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Premium Hypermarket',
                  style: subH,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'premmarket@gmail.com',
                  style: smallLabel,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //QR Code
          PrettyQr(
              typeNumber: 3,
              size: 200,
              data: printID(),
              errorCorrectLevel: QrErrorCorrectLevel.M,
              roundEdges: true),
          SizedBox(
            height: 40,
          ),
          Text(
            'Scan and confirm your footprint. Your deatils will be entered to the visitors list.',
            textAlign: TextAlign.center,
            style: bodytxtstyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                //minWidth: double.infinity,
                minHeight: 46,
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'customer_home_screen');
                },
                color: vilot,
                textColor: Colors.white,
                child: Text(
                  'Summery',
                  style: button,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

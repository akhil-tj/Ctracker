import 'package:firebase_auth/firebase_auth.dart';
import 'package:ctracker/style/color.dart';
import 'package:ctracker/style/text_style.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ShopOwnerSummery extends StatefulWidget {
  ShopOwnerSummery({Key key}) : super(key: key);

  @override
  _ShopOwnerSummeryState createState() => _ShopOwnerSummeryState();
}

FirebaseAuth auth = FirebaseAuth.instance;

String printID() {
  User user = auth.currentUser;
  String id = user.uid;
  String data = id;
  return data;
}

class _ShopOwnerSummeryState extends State<ShopOwnerSummery> {
  Query _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('merchantusers')
        .child(printID())
        .child('users')
        .orderByChild('name');
  }

  Widget _buildContactItem({Map contact}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        //tileColor: Colors.grey,
        leading: CircleAvatar(
          //backgroundColor: Color(0xff754EE4),
          radius: 26.0,
          backgroundImage: AssetImage('assets/Ellipse 2.png'),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact['name'],
              style: subH,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              contact['date'],
              style: smallLabel,
            ),
          ],
        ),
        trailing: Text(
          contact['time'],
          style: smallLabel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'qr_code_scanner');
        },
        backgroundColor: vilot,
        child: Icon(Icons.qr_code),
      ),
      appBar: AppBar(
        // leading: Container(
        //   padding: EdgeInsets.all(13),
        //   child: SvgPicture.asset(
        //     'assets/menu.svg',
        //     color: Colors.white,
        //   ),
        // ),
        backgroundColor: vilot,
        title: Text(
          'My Footprints',
          style: h2,
        ),
        automaticallyImplyLeading: false,
        actions: [
          CircleAvatar(
            //backgroundColor: Colors.white,
            radius: 18.0,
            backgroundImage: AssetImage(
              'assets/Ellipse 1.png',
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            return _buildContactItem(contact: contact);
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

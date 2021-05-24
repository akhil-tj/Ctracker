import 'package:firebase_auth/firebase_auth.dart';
import 'package:ctracker/style/color.dart';
import 'package:ctracker/style/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  CustomerHome({Key key}) : super(key: key);

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

FirebaseAuth auth = FirebaseAuth.instance;

String printID() {
  User user = auth.currentUser;
  String id = user.uid;
  String data = id;
  return data;
}

class _CustomerHomeState extends State<CustomerHome> {
  Query _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(printID())
        .child('merchantusers')
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
          backgroundImage: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/c-tracker-2021.appspot.com/o/files%2F' +
                  contact['email'] +
                  '?alt=media&token=a2d4e1d0-202e-49c4-86b7-59df731559b3'),
          backgroundColor: Colors.transparent,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact['shopname'],
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
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                contact['time'],
                style: smallLabel,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future UserProfile() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;
    DatabaseReference merchantsprofileRef =
        FirebaseDatabase.instance.reference().child("users").child(uid);

    return merchantsprofileRef.once();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: UserProfile(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
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
                  backgroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/c-tracker-2021.appspot.com/o/files%2F' +
                          snapshot.data.value['email'] +
                          '?alt=media&token=a2d4e1d0-202e-49c4-86b7-59df731559b3'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 16,
                )
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
        });
  }
}

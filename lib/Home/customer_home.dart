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
          backgroundImage: AssetImage('assets/Ellipse 2.png'),
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
  }
}

// ignore: must_be_immutable
// class CustomerHomeBody extends StatelessWidget {
//   List<CustomerHomeListTile> footPrintDetails = [
//     CustomerHomeListTile(
//       customerAvatar: 'assets/Ellipse 2.png',
//       cusName: 'Take Off Sports',
//       cusDate: '15 May 2021',
//       cusTime: '10:30am',
//     ),
//     CustomerHomeListTile(
//       customerAvatar: 'assets/Ellipse 3.png',
//       cusName: 'Broklie Store',
//       cusDate: '15 May 2021',
//       cusTime: '10:15am',
//     ),
//     CustomerHomeListTile(
//       customerAvatar: 'assets/Ellipse 4.png',
//       cusName: 'Memu Restaurent',
//       cusDate: '12 May 2021',
//       cusTime: '1:38pm',
//     ),
//     CustomerHomeListTile(
//       customerAvatar: 'assets/Ellipse 5.png',
//       cusName: 'Internet Cafe',
//       cusDate: '29 April 2021',
//       cusTime: '11:10am',
//     ),
//     CustomerHomeListTile(
//       customerAvatar: 'assets/Ellipse 6.png',
//       cusName: 'Local Store',
//       cusDate: '25 April 2021',
//       cusTime: '4:30pm',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: footPrintDetails.length,
//         itemBuilder: (context, index) {
//           return footPrintDetails[index];
//         });
//   }
// }

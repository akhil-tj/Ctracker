import 'package:ctracker/model/customer_home_list_tile.dart';
import 'package:ctracker/style/color.dart';
import 'package:ctracker/style/text_style.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class CustomerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Pressed Floating Button');
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          //   child: Text(
          //     'My Footprints',
          //     style: h2,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CustomerHomeBody(),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomerHomeBody extends StatelessWidget {
  List<CustomerHomeListTile> footPrintDetails = [
    CustomerHomeListTile(
      customerAvatar: 'assets/Ellipse 2.png',
      cusName: 'Take Off Sports',
      cusDate: '15 May 2021',
      cusTime: '10:30am',
    ),
    CustomerHomeListTile(
      customerAvatar: 'assets/Ellipse 3.png',
      cusName: 'Broklie Store',
      cusDate: '15 May 2021',
      cusTime: '10:15am',
    ),
    CustomerHomeListTile(
      customerAvatar: 'assets/Ellipse 4.png',
      cusName: 'Memu Restaurent',
      cusDate: '12 May 2021',
      cusTime: '1:38pm',
    ),
    CustomerHomeListTile(
      customerAvatar: 'assets/Ellipse 5.png',
      cusName: 'Internet Cafe',
      cusDate: '29 April 2021',
      cusTime: '11:10am',
    ),
    CustomerHomeListTile(
      customerAvatar: 'assets/Ellipse 6.png',
      cusName: 'Local Store',
      cusDate: '25 April 2021',
      cusTime: '4:30pm',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: footPrintDetails.length,
        itemBuilder: (context, index) {
          return footPrintDetails[index];
        });
  }
}

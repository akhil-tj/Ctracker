import 'package:ctracker/model/customer_home_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff754EE4),
        child: Icon(Icons.qr_code),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff754EE4),
        title: Text('Footprints'),
        automaticallyImplyLeading: false,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18.0,
            backgroundImage: AssetImage('assets/Ellipse 1.png'),
          ),
        ],
      ),
      body: CustomerHomeBody(),
    );
  }
}

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
        itemCount: footPrintDetails.length,
        itemBuilder: (context, index) {
          return footPrintDetails[index];
        });
  }
}

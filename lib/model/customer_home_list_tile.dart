import 'package:flutter/material.dart';

class CustomerHomeListTile extends StatelessWidget {
  String customerAvatar;
  String cusName;
  String cusDate;
  String cusTime;
  CustomerHomeListTile(
      {this.customerAvatar, this.cusName, this.cusDate, this.cusTime});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        //tileColor: Colors.grey,
        leading: CircleAvatar(
          backgroundColor: Color(0xff754EE4),
          radius: 26.0,
          backgroundImage: AssetImage(customerAvatar),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cusName,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              cusDate,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                color: Colors.black38,
              ),
            ),
          ],
        ),
        trailing: Text(
          cusTime,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black38,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

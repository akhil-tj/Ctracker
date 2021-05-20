import 'package:ctracker/style/text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
          //backgroundColor: Color(0xff754EE4),
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
              style: subH,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              cusDate,
              style: smallLabel,
            ),
          ],
        ),
        trailing: Text(
          cusTime,
          style: smallLabel,
        ),
      ),
    );
  }
}

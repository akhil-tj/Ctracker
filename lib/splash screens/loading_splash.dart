import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

int finalValue;

class LoadingSplashScreen extends StatefulWidget {
  LoadingSplashScreen({Key key}) : super(key: key);

  @override
  _LoadingSplashScreenState createState() => _LoadingSplashScreenState();
}

class _LoadingSplashScreenState extends State<LoadingSplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 5), () {
        switch (finalValue) {
          case 1:
            {
              Navigator.pushNamed(context, 'customer_home_screen');
              break;
            }

          case 2:
            {
              Navigator.pushNamed(context, 'shop_owner_home_screen');
              break;
            }
          default:
            {
              Navigator.pushNamed(context, 'onboard');
              break;
            }
        }
      });
    });
    // (finalValue != 1)
    //           ? Navigator.pushNamed(context, 'customer_login')
    //           : Navigator.pushNamed(context, 'customer_home_screen')
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedValue = sharedPreferences.getInt('value');
    setState(() {
      finalValue = obtainedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lf30_editor_jg9yewda.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

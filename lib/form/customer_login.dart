import 'package:ctracker/form/customer_signup.dart';
import 'package:ctracker/style/color.dart';
import 'package:ctracker/style/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CustomerLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.west),
          onTap: () {
            Navigator.pushNamed(context, 'customer_signup');
          },
        ),
        title: Text(
          'Login as Customer',
          style: h2,
        ),
        backgroundColor: vilot,
      ),
      body: SingleChildScrollView(
        child: CustomerLoginFormContents(),
      ),
    );
  }
}

class CustomerLoginFormContents extends StatefulWidget {
  @override
  _CustomerLoginFormContentsState createState() =>
      _CustomerLoginFormContentsState();
}

class _CustomerLoginFormContentsState extends State<CustomerLoginFormContents> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            'Welcome back! Please login to continue.',
            textAlign: TextAlign.left,
            style: textBtn,
          ),
          SizedBox(
            height: 8,
          ),
          TextFieldContainer(
            controller: emailTextEditingController,
            label: 'Email',
            type: TextInputType.emailAddress,
            pass: false,
          ),
          TextFieldContainer(
            controller: passwordTextEditingController,
            label: 'Password',
            type: TextInputType.text,
            pass: true,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Forgot password?',
            textAlign: TextAlign.right,
            style: bodytxtstyle,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
                minHeight: 46,
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  if (!emailTextEditingController.text.contains("@")) {
                    displayToastMessage("Email address is not valid", context);
                  } else if (passwordTextEditingController.text.isEmpty) {
                    displayToastMessage("Password is mandatory.", context);
                  } else {
                    loginAndAuthenticateUser(context);
                  }
                },
                color: vilot,
                textColor: Colors.white,
                child: Text(
                  'Login',
                  style: button,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Text(
                  'Don\'t have account?',
                  textAlign: TextAlign.left,
                  style: bodytxtstyle,
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'customer_signup');
                  },
                  child: Text(
                    'Create one',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: vilot,
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, 'customer_home_screen', (route) => false);
          displayToastMessage("you are logged-in now.", context);
        } else {
          _firebaseAuth.signOut();
          displayToastMessage(
              "No record exists for this user. Please create new account.",
              context);
        }
      });
    } else {
      displayToastMessage("Error Occured, can not", context);
    }
  }
}

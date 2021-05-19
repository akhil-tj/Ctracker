import 'package:ctracker/form/customer_signup.dart';
import 'package:flutter/material.dart';

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
        title: Text('Login'),
        backgroundColor: Color(0xff754EE4),
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
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextFieldContainer(
            label: 'Email',
            type: TextInputType.emailAddress,
            pass: false,
          ),
          TextFieldContainer(
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
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 19,
              //fontWeight: FontWeight.w500,
            ),
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
                  Navigator.pushNamed(context, 'customer_home_screen');
                },
                color: Color(0xff754EE4),
                textColor: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                  ),
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
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 19,
                  ),
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
                      color: Color(0xff754EE4),
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
}

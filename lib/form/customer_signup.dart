import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.west),
          onTap: () {
            Navigator.pushNamed(context, 'onboard');
          },
        ),
        title: Text('Create Account'),
        backgroundColor: Color(0xff754EE4),
      ),
      body: SingleChildScrollView(
        child: SignupFormContents(),
      ),
    );
  }
}

class SignupFormContents extends StatefulWidget {
  @override
  _SignupFormContentsState createState() => _SignupFormContentsState();
}

class _SignupFormContentsState extends State<SignupFormContents> {
  String onOff = 'No';
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
            'Signup to track your foot and confirm your footprint, with c-tracker.',
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
            label: 'Full Name',
            type: TextInputType.name,
            pass: false,
          ),
          TextFieldContainer(
            label: 'Email',
            type: TextInputType.emailAddress,
            pass: false,
          ),
          TextFieldContainer(
            label: 'Pincode',
            type: TextInputType.number,
            pass: false,
          ),
          TextFieldContainer(
            label: 'Password',
            type: TextInputType.text,
            pass: true,
          ),
          TextFieldContainer(
            label: 'Confirm Password',
            type: TextInputType.text,
            pass: true,
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
                  print('Button 2');
                },
                color: Colors.white,
                textColor: Color(0xff754EE4),
                child: Text(
                  'Upload Profile Image',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    //fontWeight: FontWeight.w700,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff754EE4), width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vaccinated',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 19,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Color(0xff754EE4),
                    value: 'Yes',
                    groupValue: onOff,
                    onChanged: (val) {
                      onOff = val;
                      setState(() {});
                    },
                  ),
                  Text(
                    'Yes',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                    ),
                  ),
                  Radio(
                    activeColor: Color(0xff754EE4),
                    value: 'No',
                    groupValue: onOff,
                    onChanged: (val) {
                      onOff = val;
                      setState(() {});
                    },
                  ),
                  Text(
                    'No',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 19,
                    ),
                  ),
                ],
              )
            ],
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
                  'Lets Get Started',
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
                  'Have an account?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 19,
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'customer_login');
                  },
                  child: Text(
                    'Login here.',
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

class TextFieldContainer extends StatelessWidget {
  String label;
  TextInputType type;
  bool pass;
  TextFieldContainer({this.label, this.type, this.pass});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xfff1f1f1),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: TextField(
          obscureText: pass,
          keyboardType: type,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Color(0xffa1a1a1),
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
            hintText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

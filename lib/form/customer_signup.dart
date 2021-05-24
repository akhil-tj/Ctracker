import 'dart:io';
import 'package:ctracker/Home/shop_owner_home.dart';
import 'package:ctracker/api/firebase_api.dart';
import 'package:ctracker/style/color.dart';
import 'package:ctracker/style/text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

import '../main.dart';

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
        title: Text(
          'Create Customer Account',
          style: h2,
        ),
        backgroundColor: vilot,
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
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController pincodeTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  String onOff = 'No';
  UploadTask task;
  File file;
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';
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
            style: textBtn,
          ),
          SizedBox(
            height: 8,
          ),
          TextFieldContainer(
            controller: nameTextEditingController,
            label: 'Full Name',
            type: TextInputType.name,
            pass: false,
          ),
          TextFieldContainer(
            controller: emailTextEditingController,
            label: 'Email',
            type: TextInputType.emailAddress,
            pass: false,
          ),
          TextFieldContainer(
            controller: pincodeTextEditingController,
            label: 'Pincode',
            type: TextInputType.number,
            pass: false,
          ),
          TextFieldContainer(
            controller: phoneTextEditingController,
            label: 'Phone Number',
            type: TextInputType.phone,
            pass: false,
          ),
          TextFieldContainer(
            controller: passwordTextEditingController,
            label: 'Password',
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
                onPressed: selectFile,
                color: Colors.white,
                textColor: vilot,
                child: Text(
                  'Select Profile Image',
                  style: button,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: vilot,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Text(
            fileName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   child: ConstrainedBox(
          //     constraints: const BoxConstraints(
          //       minWidth: double.infinity,
          //       minHeight: 46,
          //     ),
          //     // ignore: deprecated_member_use
          //     child: FlatButton(
          //       onPressed: uploadFile,
          //       color: Colors.white,
          //       textColor: vilot,
          //       child: Text(
          //         'Upload Profile Image',
          //         style: button,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(
          //           color: vilot,
          //           width: 2,
          //         ),
          //         borderRadius: BorderRadius.circular(6),
          //       ),
          //     ),
          //   ),
          // ),
          // task != null ? buildUploadStatus(task) : Container(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vaccinated',
                textAlign: TextAlign.left,
                style: bodytxtstyle,
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
                    style: bodytxtstyle,
                  ),
                  Radio(
                    activeColor: vilot,
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
                    style: bodytxtstyle,
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
                  if (nameTextEditingController.text.length < 3) {
                    displayToastMessage(
                        "name must be atleast 3 character", context);
                  } else if (!emailTextEditingController.text.contains("@")) {
                    displayToastMessage("Email address is not valid", context);
                  } else if (pincodeTextEditingController.text.isEmpty) {
                    displayToastMessage("Pincode is mandatory", context);
                  } else if (passwordTextEditingController.text.length < 6) {
                    displayToastMessage(
                        "Password must be atleast 6 characters.", context);
                  } else if (phoneTextEditingController.text.isEmpty) {
                    displayToastMessage("Phone Number is mandatory", context);
                  } else {
                    registerNewUser(context);
                  }
                  uploadFile();
                },
                color: vilot,
                textColor: Colors.white,
                child: Text(
                  'Lets Get Started',
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
                  'Have an account?',
                  textAlign: TextAlign.left,
                  style: bodytxtstyle,
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

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = emailTextEditingController.text;
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "pincode": pincodeTextEditingController.text.trim(),
        "phonenumber": phoneTextEditingController.text.trim(),
        "Vaccinated": onOff.trim(),
      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Congratulations, your account has been created.", context);
      Navigator.pushNamedAndRemoveUntil(
          context, 'customer_home_screen', (route) => false);
    } else {
      displayToastMessage("New user account has not been Created.", context);
    }
  }
}

// ignore: must_be_immutable
class TextFieldContainer extends StatelessWidget {
  String label;
  TextInputType type;
  bool pass;
  TextEditingController controller;
  TextFieldContainer({this.label, this.type, this.pass, this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: textboxColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: TextField(
          controller: controller,
          obscureText: pass,
          keyboardType: type,
          style: labelBlack,
          decoration: InputDecoration(
            hintStyle: labelGrey,
            hintText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}

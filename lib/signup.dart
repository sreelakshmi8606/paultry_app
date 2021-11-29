import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/login.dart';
import 'package:e_comm/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _passwordVisible = false;
  bool _autoValidate = false;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController textInputController = new TextEditingController();
  TextEditingController textControllerEmail = new TextEditingController();
  TextEditingController  textControllerPassword = new TextEditingController();
  TextEditingController cpasswordInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Form(
            key: _registerFormKey,
            // ignore: deprecated_member_use
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      //decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter full Name',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        controller: textInputController,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your E mail',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          return Validate.emailValidator(value!);
                        },
                        controller: textControllerEmail,
                      ),
                    ),
                  ),
                  // Padding(padding: EdgeInsets.all(8.0)),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          suffixIcon: IconButton(
                            color: Colors.black,
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                this._passwordVisible = !this._passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          return Validate.pwdValidator(value!);
                        },
                        controller: textControllerPassword,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          suffixIcon: IconButton(
                            color: Colors.black,
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                this._passwordVisible = !this._passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          return Validate.pwdValidator(value!);
                        },
                        controller: cpasswordInputController,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(25.0),
                  //   child: Container(
                  //     child: TextFormField(
                  //       obscureText: false,
                  //       decoration: InputDecoration(
                  //         hintText: 'Mobile Number',
                  //         hintStyle: TextStyle(color: Colors.black),
                  //         labelStyle: TextStyle(color: Colors.black),
                  //         enabledBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //         focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //         border: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //       ),
                  //       validator: (value) {
                  //         return Validate.phoneValidator(value!);
                  //       },
                  //       controller: phnInputController,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(25.0),
                  //   child: Container(
                  //     child: TextFormField(
                  //       obscureText: false,
                  //       decoration: InputDecoration(
                  //         hintText: 'Your Location',
                  //         hintStyle: TextStyle(color: Colors.black),
                  //         labelStyle: TextStyle(color: Colors.black),
                  //         enabledBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //         focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //         border: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //       ),
                  //       validator: (value) {
                  //         return Validate.emailValidator(value!);
                  //       },
                  //       controller: locationInputController,
                  //     ),
                  //   ),
                  // ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      if (_registerFormKey.currentState!
                          .validate()) if ( textControllerPassword
                          .text ==
                          cpasswordInputController.text) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: textControllerEmail.text,
                            password:  textControllerPassword.text)
                            .then((user) => FirebaseFirestore.instance
                            .collection('/users')
                            .doc(user.user!.uid)
                            .set({
                          "uid":user.user!.uid,
                          "fullname":
                          textInputController.text.toUpperCase(),
                          "email": textControllerEmail.text.trim(),
                        })
                            .then((result) => {
                          FirebaseFirestore.instance
                              .collection("login")
                              .doc(user.user!.uid)
                              .set({
                            "email": textControllerEmail.text,
                            "usertype": "user",
                            "status": "1",
                            "password": textControllerPassword.text
                          }).then((_) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                                    (_) => false);
                          }).catchError((e) => print(e)),
                        })
                            .catchError((err) => print(err)))
                            .catchError(
                              (e) {
                            String errorMessage;
                            switch (e.code) {
                              case "ERROR_INVALID_EMAIL":
                                errorMessage =
                                "Your email address appears to be malformed.";
                                break;
                              case "ERROR_WEAK_PASSWORD":
                                errorMessage =
                                "password consist of atleast 6 characters";
                                break;
                              case "ERROR_USER_NOT_FOUND":
                                errorMessage =
                                "User with this email doesn't exist.";
                                break;
                              case "ERROR_USER_DISABLED":
                                errorMessage =
                                "User with this email has been disabled.";
                                break;
                              case "ERROR_TOO_MANY_REQUESTS":
                                errorMessage =
                                "Too many requests. Try again later.";
                                break;
                              case "ERROR_OPERATION_NOT_ALLOWED":
                                errorMessage =
                                "Signing in with Email and Password is not enabled.";
                                break;
                              case "ERROR_EMAIL_ALREADY_IN_USE":
                                errorMessage =
                                "The email has already been registered. ";
                                break;
                              default:
                                errorMessage = "An undefined Error happened.";
                            }
                            showAlertDialog(context, errorMessage);
                          },
                        );
                      } else {
                        showAlertDialog(context, "Password missmatch");
                      }
                    },
                    child: Text('Register',),
                    color: Colors.lightGreen.shade900,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String message) {
    // set up the buttons
    // ignore: deprecated_member_use
    Widget cancelButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Register Error"),
      content: Text(message),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print, avoid_unnecessary_containers, use_key_in_widget_constructors, deprecated_member_use, unused_field

// ignore_for_file: deprecated_member_use, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/BranchBloc/branchlist_cubit.dart';
import 'package:e_comm/SelectBranch.dart';
import 'package:e_comm/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool _isProcessing = false;
  late String uid;
  late String email;
  late String userEmail;
  late String name;
  late String imageUrl;
  late bool authSignedIn;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: ShapeDecoration(
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(30.0)),
      // ),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.lightGreen.shade900, width: 3),
          ),
          color: Colors.white,
        ),
        child: OutlineButton(
          // highlightColor: Colors.blueGrey[100],
          // splashColor: Colors.blueGrey[200],
          onPressed: () async {
            setState(() {
              _isProcessing = true;
            });
            await Authentication.signInWithGoogle(context: context)
                .then((result) {
                  FirebaseFirestore.instance.collection('users')
                   .get().then((result) =>
                      // Navigator.of(context).pop();
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) =>
                            BranchlistCubit(url: '')..fetchData(),
                            child: SelectBranch(email: '', uid: ''),
                          ))),
                      );
              print(result);
              // Navigator.of(context).pop();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => BlocProvider(
              //               create: (context) =>
              //                   BranchlistCubit(url: '')..fetchData(),
              //               child: SelectBranch(email: '', uid: ''),
              //             )));
            }).catchError((error) {
              print('Registration Error: $error');
            });
            setState(() {
              _isProcessing = false;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.lightGreen.shade900, width: 3),
          ),
          highlightElevation: 0,
          // borderSide: BorderSide(color: Colors.blueGrey, width: 3),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: _isProcessing
                ? CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.blueGrey,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/google_logo.png"),
                        height: 30.0,
                      ),
                      // Image(image: ,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, avoid_print, deprecated_member_use, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/AuthenticationBloc/authenticationbloc_cubit.dart';
import 'package:e_comm/GoogleButton.dart';
import 'package:e_comm/SelectBranch.dart';
import 'package:e_comm/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  // final  String email;
  // final String uid;
  // Login({ this.email, this.uid});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // @override
  // void initState() {
  //   _passwordVisible = false;
  //   super.initState();
  // }
  bool visible = true;
  // bool _passwordVisible = false;
  // bool _isEditingEmail = false;
  // bool _isEditingPassword = false;
  // bool _isRegistering = false;
  // bool _isProcessing = false;
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late  String email;
   late String uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  // child: _title(),
                  decoration: BoxDecoration(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'user@gmail.com',
                            hintStyle: TextStyle(color: Colors.black12),
                            labelStyle: TextStyle(
                              color: Colors.lightGreen.shade900,
                            ),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.lightGreen.shade900,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(20.0),
                            // ),
                          ),
                          validator: (value) {
                            return Validate.emailValidator(value!);
                          },
                          controller: textControllerEmail,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '******',
                            hintStyle: TextStyle(color: Colors.black12),
                            labelStyle: TextStyle(
                              color: Colors.lightGreen.shade900,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                child: Icon(
                                  visible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.lightGreen.shade900,
                                )),

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(20.0),
                            // ),
                          ),
                          validator: (value) {
                            return Validate.pwdValidator(value!);
                          },
                          controller: textControllerPassword,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      onTap: () {
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        // builder: (context) => Resetpswd()));
                      },
                    ),
                    DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                              color: Colors.lightGreen.shade900, width: 3),
                        ),
                        color: Colors.white,
                      ),
                      child: OutlineButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Colors.lightGreen.shade900, width: 3),
                          ),
                          highlightElevation: 0,
                          splashColor: Colors.lightGreen.shade900,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Icon(Icons.login),// icon
                              Image(
                                image: AssetImage("assets/images/login.png"),
                                height: 30.0,
                              ),
                              Text(" Login"), // text
                           // BlocBuilder<AuthenticationblocCubit, AuthenticationblocState>(
                           //   builder: (context, state){
                           //     if (state is AuthenticationSuccess) {
                           //       var result =
                           //       userCollection.doc(
                           //           state.authenticationDetail.uid).update(
                           //         {
                           //           'u_id': state.authenticationDetail.uid,
                           //           'email': state.authenticationDetail.email,
                           //         },
                           //       );
                           //       Navigator.push(
                           //           context,
                           //           MaterialPageRoute(
                           //               builder: (context) =>
                           //                   SelectBranch(
                           //                     uid: state.authenticationDetail
                           //                         .uid!,
                           //                     email: state.authenticationDetail
                           //                         .email!,
                           //                   )));
                           //     }
                           //   },
                           // ),
                                    ],
                          ),
                          // Text('Login'),
                          // color: Color(0xffEE7B23),

                          onPressed: () {
                            // Future<void> addUser() {
                            //   return users
                            //       .add({
                            //     'email': email,
                            //     'uid': uid,
                            //   })
                            //       .then((value) => print("User Added"))
                            //       .catchError((error) =>
                            //       print("Failed to add user: $error"));
                            // }
                            if (_loginFormKey.currentState!.validate()) {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                  email: textControllerEmail.text.trim(),
                                  password: textControllerPassword.text.trim())
                                  .then(
                                      (user) =>
                                      FirebaseFirestore.instance
                                          .collection('login')
                                          .doc(user.user!.uid)
                                          .update({
                                        'email': textControllerEmail.text,
                                        'uid': user.user!.uid,
                                      })     .then((value) =>
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SelectBranch(
                                                        uid: uid,
                                                        email:email,
                                                      )))),

                                //  else if (value.data()?['usertype'] ==
                                //                                 "admin" &&
                                //                             value.data()!['status'] == 1) {
                                //                           FirebaseFirestore.instance
                                //                               .collection('')
                                //                               .doc(user.user!.uid)
                                //                               .get()
                                //                               .then((value) => Navigator.push(
                                //                                   context,
                                //                                   MaterialPageRoute(
                                //                                       builder: (context) =>
                                //                                           SelectBranch(
                                //                                             uid: value
                                //                                                 .data()!['uid'],
                                //                                             email: value
                                //                                                 .data()!['email'],
                                //                                           ))));
                                //                         }
                                //                       }),
                                //                     );
                                //               },
                                //             ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(height: 20.0),
                                // GestureDetector(
                                //   onTap: () {
                                //     // Navigator.push(context,
                                //     // MaterialPageRoute(builder: (context) => (
                                //     // Signup())));
                                //   },
                                //   child: Text.rich(
                                //     TextSpan(text: 'Don\'t have an account?', children: [
                                //       TextSpan(
                                //         text: 'SignUp Here',
                                //         style: TextStyle(
                                //             color: Colors.lightGreen.shade900,
                                //             fontWeight: FontWeight.bold,
                                //             fontStyle: FontStyle.italic),
                                //       ),
                                //     ]),
                                //   ),
                                // ),
                                // SizedBox(height: 10.0),
                                // Text(
                                //   "--",
                                //   style: TextStyle(fontWeight: FontWeight.bold),
                                // ),
                                // SizedBox(height: 10.0),
                                // Text(
                                //   "OR",
                                //   style: TextStyle(fontWeight: FontWeight.bold),
                                // ),
                                // SizedBox(height: 20.0),
                                // Center(child: GoogleButton()),
                              );
                            }
                          }
              )
              )
          ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
//   Widget _title() {
//     return ShaderMask(
//       shaderCallback: (Rect bounds) {
//         return gradient.createShader(Offset.zero & bounds.size);
//       },
//       child: Center(
//         child: Text('Poultry',
//             style: GoogleFonts.diplomata(
//               color: Colors.white,
//               fontSize: 35.0,
//               fontWeight: FontWeight.bold,
//             )),
//       ),
//     );
//   }
}



// import 'package:flutter/material.dart';
//
// // Import the firebase_core and cloud_firestore plugin
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddUser extends StatefulWidget {
//    late final String email;
//    late final String uid;
//    AddUser(this.email, this.uid,);
//
//   @override
//   State<AddUser> createState() => _AddUserState();
// }
//
// class _AddUserState extends State<AddUser> {
//    late String email;
//    late  String uid;
//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//         'email': widget.email, // John Doe
//         'uid': widget.uid, // Stokes and Sons
//       })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//
//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }
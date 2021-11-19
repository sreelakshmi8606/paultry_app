
// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_comm/GoogleButton.dart';
import 'package:e_comm/SelectBranch.dart';
import 'package:e_comm/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'BranchBloc/branchlist_cubit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  bool _passwordVisible = false;
  bool _isEditingEmail = false;
  bool _isEditingPassword = false;
  bool _isRegistering = false;
  bool _isProcessing = false;
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
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
                  decoration: BoxDecoration(
                  ),
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
                        fontSize: 25.0, fontWeight: FontWeight.bold,color: Colors.lightGreen.shade900,),
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
                            labelStyle: TextStyle(color: Colors.lightGreen.shade900,),
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
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '******',
                            hintStyle: TextStyle(color: Colors.black12),
                            labelStyle: TextStyle(color: Colors.lightGreen.shade900,),
                            suffixIcon: IconButton(
                              color: Colors.lightGreen.shade900,
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  this._passwordVisible =
                                  !this._passwordVisible;
                                });
                              },
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
                          side: BorderSide(color:Colors.lightGreen.shade900, width: 3),
                        ),
                        highlightElevation: 0,
                        splashColor:Colors.lightGreen.shade900,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Icon(Icons.login),// icon
                            Image(
                              image: AssetImage("assets/images/login.png"),
                              height: 30.0,
                            ),
                            Text(" Login"), // text
                          ],
                        ),
                        // Text('Login'),
                        // color: Color(0xffEE7B23),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider(
                            create: (context) => BranchlistCubit(url: '')..fetchData(),
                             child: SelectBranch()),
                      ),
                          );
                      }
                    ),
                    )
                  ],

                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => (
                  // Signup())));
                },
                child: Text.rich(
                  TextSpan(text: 'Don\'t have an account?', children: [
                    TextSpan(
                      text: 'Signup Here',
                      style: TextStyle(
                          color:Colors.lightGreen.shade900,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "--",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Center(child: GoogleButton()),
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

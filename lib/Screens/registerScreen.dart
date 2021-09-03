import 'dart:io';

import 'package:try_salestrail/Screens/loginScreen.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:email_auth/email_auth.dart';
import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static const id = 'registration_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String username = '';
  String confirmPassword = '';
  String otp = '';
  final TextEditingController controllerEmail = new TextEditingController();
  final TextEditingController controllerPwd = new TextEditingController();
  final TextEditingController controllerConfirmPwd = new TextEditingController();
  final TextEditingController controllerUserName = new TextEditingController();
  final TextEditingController controllerOTP = new TextEditingController();


  bool showSpinner = false;
  bool validEmail = false;
  bool sendOTP=false;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPwd.dispose();
    controllerConfirmPwd.dispose();
    controllerUserName.dispose();
    controllerOTP.dispose();
    super.dispose();}

  //OTP methods
  void sendOtp() async {
    EmailAuth.sessionName = "EnvaCalls";
    var data = await EmailAuth.sendOtp(receiverMail: email);
  }

  bool verify() {
    bool res = EmailAuth.validate(receiverMail: email, userOTP: otp);
    return res;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage('images/logoo(1).png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Register',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: kPink,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          sendOTP?'Please check your mail':'Welcome to EnvaCalls ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: kGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Material(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(90.0)),
                  color: Colors.white,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      child: Form(
                        key: _formKey,
                        child: validEmail
                            ? ListView(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    TextFormField(
                                      validator: (username) {
                                        if (username == '')
                                          return 'Please enter a name';

                                        return null;
                                      },
                                      controller: controllerUserName,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        //  email = myControllerUserName.text;
                                        username = controllerUserName.text;
                                      },
                                      decoration: kTextFieldDecoration.copyWith(
                                        hintText: 'Enter your Name',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      controller: controllerPwd,
                                        validator: (password) {
                                          if (password == null)
                                            return 'Please enter your password';
                                          if (password.length < 8)
                                            return 'at least 8 characters';
                                          return null;
                                        },
                                        obscureText: true,
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          password = controllerPwd.text;
                                        },
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                hintText: 'Enter your password',
                                                prefixIcon: Icon(Icons.lock))),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    TextFormField(
                                      controller: controllerConfirmPwd,
                                        validator: (confirmPassword) {
                                          if (confirmPassword == '')
                                            return 'Please confirm your password';
                                          if (password != confirmPassword)
                                            return 'Please enter the same password';
                                          return null;
                                        },
                                        obscureText: true,
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          confirmPassword = value;
                                        },
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                                hintText:
                                                    'confirm your password',
                                                prefixIcon: Icon(Icons.lock))),
                                    SizedBox(
                                      height: 14.0,
                                    ),
                                    RoundedButton(
                                        text: 'Register',
                                        onPress: () async {
                                          if(_formKey.currentState.validate()) {
                                            setState(() {
                                              showSpinner = true;
                                            });

                                            try {
                                              final newUser = await _auth
                                                  .createUserWithEmailAndPassword(
                                                  email: email,
                                                  password: password);

                                              if (newUser != null) {
                                                /*  _firestore.collection('Users').add({
                                        'email':email , 'password':password , 'username':username ,
                                      });*/

                                                _firestore
                                                    .collection("Users")
                                                    .add({
                                                  "email": email,
                                                  "username": username,
                                                  "password": password
                                                }).then((value) {
                                                  print(value);
                                                });

                                                Navigator.pushNamed(
                                                    context, LoginScreen.id);
                                              }
                                              else
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text('Registration failed \n try again ')),
                                                );

                                              setState(() {
                                                showSpinner = false;
                                              });
                                            } catch (e) {
                                              print(e);
                                            }
                                            controllerPwd.clear();
                                            controllerConfirmPwd.clear();
                                            controllerUserName.clear();
                                          } }),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already have an account? ',
                                        style: kTextStyle2.copyWith(
                                            color: kPurple,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      Expanded(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.popAndPushNamed(context, LoginScreen.id);
                                              /* setState(() {
                                                validEmail = true;
                                              });*/
                                            },
                                            child: Text(
                                              'Sign in',
                                              style: kTextStyle2.copyWith(
                                                  color: kPurple,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            )),
                                      )
                                    ],
                                  )
                                  ])
                            : ListView(
                         // padding: EdgeInsets.only(top:50,bottom: 100),
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [

                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('A validation code will be sent to your email',  textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: kGrey,
                                          ),),
                                 SizedBox(height: 50.0,),

                                 sendOTP? TextFormField(
                                         controller: controllerOTP,
                                          validator: (otp) {
                                            if (otp == '')
                                              return 'Please enter the OTP';

                                            if (!verify())
                                              return 'OTP is not correct';

                                            return null;
                                          },
                                          textAlign: TextAlign.center,
                                          onChanged: (value) {
                                            otp = controllerOTP.text;
                                          },
                                          decoration: kTextFieldDecoration.copyWith(
                                            hintText:
                                                'Enter the code received',
                                            //prefixIcon: Icon(Icons.person),
                                          ),
                                        )
                                 : TextFormField(
                                         validator: (email) {
                                           if (email == '')
                                             return 'Please enter an email';
                                           if (!EmailValidator.validate(email))
                                             return 'Please enter a valid email';

                                           return null;
                                         },
                                         keyboardType: TextInputType.emailAddress,
                                         textAlign: TextAlign.center,
                                         onChanged: (value) {
                                           email = controllerEmail.text;
                                         },
                                         decoration: kTextFieldDecoration.copyWith(
                                             hintText: 'Enter your email',
                                             prefixIcon: Icon(Icons.mail),

                                 ),),
                                        SizedBox(
                                          height: 30.0,
                                        ),

                                        sendOTP?Row(
                                          children: [
                                            Expanded(

                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: RoundedButton(
                                                    text: 'Return',
                                                    onPress: () {

                                                      setState(() {

                                                        sendOTP = false;

                                                      });
                                                      controllerOTP.clear();}
                                                ),
                                              ),
                                            ),

                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: RoundedButton(
                                                    text: 'Continue',
                                                    onPress: () {
                                                      if (_formKey.currentState.validate() &&
                                                          verify()) {
                                                        setState(() {
                                                          validEmail = true;
                                                          sendOTP=false;
                                                        });
                                                        controllerOTP.clear();
                                                        controllerEmail.clear();

                                                      }
                                                    }),
                                              ),
                                            )
                                          ],
                                        )
                                            : RoundedButton(
                                            text: 'Submit',
                                            onPress: () {
                                              if (_formKey.currentState.validate() ) {
                                                sendOtp();
                                                setState(() {

                                                  sendOTP = true;
                                                });
                                              }
                                            }),



                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            /*Text(
                                              'Already have an account? ',
                                              style: kTextStyle2.copyWith(
                                                  color: kPurple,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),*/
                                            Expanded(
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.popAndPushNamed(context, LoginScreen.id);
                                                   /* setState(() {
                                                      validEmail = true;
                                                    });*/
                                                  },
                                                  child: Text(
                                                    'Already have an account? Sign in',
                                                    style: kTextStyle2.copyWith(
                                                        color: kPurple,
                                                        fontWeight: FontWeight.w700),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                      )),
                ),
              )
            ]));
  }
}

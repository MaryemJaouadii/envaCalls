import 'package:email_validator/email_validator.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/Screens/registerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/constants.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String email='';
    String password='';

    final _auth = FirebaseAuth.instance;
    bool showSpinner = false;

     final myControllerEmail = TextEditingController();
    final myControllerPassword = TextEditingController();

    @override
    void dispose() {
      myControllerEmail.dispose();
      myControllerPassword.dispose();
      super.dispose();
    }

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
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            /*Icon(Icons.phone_in_talk,color:kPurple ,size: 50),
                      Text(' EnvaCalls ',style: TextStyle(color: kPurple,fontSize: 42,fontWeight: FontWeight.w700),)*/
                            Image(
                              image: AssetImage('images/logoo(1).png'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Login',
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
                          'Please Enter your work email and password ',
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
                flex: 6,
                child: Material(
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(90.0)),
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          //mainAxisAlignment: MainAxisAlignment.center,
                         // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              validator: (email) {
                                if (email == '')
                                  return 'Please enter an email';
                                if (!EmailValidator.validate(email))
                                  return 'Please enter a valid email';

                                return null;
                              },
                              controller: myControllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                email=value;
                                //  email = myControllerEmail.text;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your email',
                                prefixIcon: Icon(Icons.mail),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                                validator: (password) {
                                  if (password == null)
                                    return 'Please enter your password';
                                  if (password.length < 8)
                                    return 'at least 8 characters';
                                  return null;
                                },
                                controller: myControllerPassword,
                                obscureText: true,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  // password = myControllerPassword.text;
                                  password=value;
                                },
                                decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Enter your password',
                                    prefixIcon: Icon(Icons.lock))),
                            SizedBox(
                              height: 14.0,
                            ),
                            RoundedButton(
                                text: 'Sign in',
                                onPress: () async {
    if(_formKey.currentState.validate()){
    setState(() {
    showSpinner = true;
    });


    try {
    final user = await _auth.signInWithEmailAndPassword(
    email: email, password: password);

    if (user != null) {
    Navigator.pushNamed(context, OverViewScreen.id);
    }
    /*else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Check again your credentials.if the problem persist connect your team manager ')),
      );
    }*/


    setState(() {
    showSpinner=false;
    });


    }
    catch(e) {
    print(e);
    }


    }  }),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Text('Are you the first from your organization?',style: kTextStyle1 , textAlign: TextAlign.center,),
                             /*   Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, RegisterScreen.id);
                                        },
                                        child: Text(
                                          'Are you the first from your organization? ',
                                          style: kTextStyle2.copyWith(
                                              color: kPurple),
                                          textAlign: TextAlign.center,
                                        ))),*/
                                Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.popAndPushNamed(context, RegisterScreen.id);
                                        /* setState(() {
                                                validEmail = true;
                                              });*/
                                      },
                                      child: Text(
                                        'Are you the first from your organization? Register',
                                        style: kTextStyle2.copyWith(
                                            color: kPurple,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              )
            ]));
  }
}

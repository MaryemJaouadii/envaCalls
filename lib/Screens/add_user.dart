import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'package:mailer/smtp_server.dart';
import 'callsInformationScreen.dart';
import 'package:searchfield/searchfield.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'userManagementScreen.dart';
import 'dart:math';
import 'package:email_validator/email_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';



const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class AddUser extends StatefulWidget {
  static const id = 'add_user';
  const AddUser({Key key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  // final password = RandomPasswordGenerator();

  final _auth = FirebaseAuth.instance;

  String emailAddress = '';

  final myControllerEmail = TextEditingController();
  final myControllerUsername = TextEditingController();

  String password = getRandomString(10);

  String username = '';

  bool showSpinner = false;

  final _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();





  Future sendEmail() async {


    final user = await GoogleAuthApi.signIn();

    if (user == null ) return ;

    final emailsender = user.email;

    final auth= await user.authentication;
    final token=auth.accessToken;

    print('Authenticated: $emailsender');

final smtpServer = gmailSaslXoauth2(emailsender, token);


    final message= Message()
    ..from = Address(emailsender, 'Admin')
    ..recipients = [emailAddress]
    ..subject = 'Join EnvcaCalls'
    ..text = 'You are invited to join EnvaCalls please use $password as your password ';

try {
  await send(message, smtpServer);
  showSnackBar('email sent successfully');
} on MailerException catch (e) {
  print('authentication did not work because of $e');
}



  }



  void showSnackBar(String text) {
    final snackBar = SnackBar(content:
    Text(text, style: TextStyle(fontSize: 20),
    ),
      backgroundColor: kGreen,
    );

    ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);


  }




  @override
  void dispose() {
    myControllerEmail.dispose();
    myControllerUsername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBars(
       /* userPicture: 'profilepic.jpeg',
        userName: 'Ian Miller',
        userEmail: 'ianmiller@gmail.com',*/
      ),
      drawer: ClipRect(
        // borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
        // borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
        // borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(50.0)),
                  color: Colors.transparent,
                ),
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    'Ian Miller',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    'ianmiller@gmail.com',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: kGradientBlue,
                    ),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50.0)),
                  ),
                  currentAccountPicture: new CircleAvatar(
                    radius: 50.0,
                    //backgroundColor: const Color(0xFF778899),
                    backgroundImage: AssetImage("images/profilepic.jpeg"),
                  ),
                ),
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.analytics),
                  title: Text(
                    'Analytics Overview',
                    style: kTextStyle3,
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, OverViewScreen.id);
                },
              ),
              GestureDetector(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      'Call Performance',
                      style: kTextStyle3,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, CallPerformanceScreen.id);
                  }),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.mic),
                  title: Text(
                    'Recordings',
                    style: kTextStyle3,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(
                  'Team Management',
                  style: kTextStyle3,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'User Management',
                  style: kTextStyle3,
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: kTextStyle3,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: kBottomBorderForContainer,
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About',
                  style: kTextStyle3,
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Log out',
                  style: kTextStyle3,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(padding: EdgeInsets.all(8.0), children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Management',
                style: kSubtitleStyle_purple.copyWith(fontSize: 25.0),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Add a User',
                style: TextStyle(
                    color: kPink, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Congrats for enlarging your company!',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add User By Email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: myControllerEmail,
                  validator: (email) {
                    if (email == '') return 'Please enter an email';
                    if (!EmailValidator.validate(email))
                      return 'Please enter a valid email';

                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) async {
                    // email = value;
                    emailAddress = myControllerEmail.text;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter work email',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black38,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: myControllerUsername,
                  textAlign: TextAlign.center,
                  onChanged: (value) async {
                    //  username = value;
                    username = myControllerUsername.text;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter username',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black38,
                    ),
                  ),
                ),

                /*  TextField(

                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kGreen, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter work email',
                      ),

                      onChanged: (value) {
                        //  email = myControllerUserName.text;
                        email=value;

                      },


                    ),
*/

                /*

                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kGreen, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter username',
                      ),

                      onChanged: (value) {
                        //  email = myControllerUserName.text;
                        username=value;

                      },

                    ),
*/
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedSubmitButton(
                  text: 'Add User',
                  onPress: () async {


                    bool existEmail=false;

                    void usersStream() async {
                      List emails = [];
                      await for (var snapshot in _firestore.collection('Users').snapshots()) {
                        for (var message in snapshot.docs) emails.add(message.data()["email"]);
                      }

                      if (emails.contains(emailAddress)) {
                       existEmail=true;
                      }
                      else {
                        existEmail=false;
                      }


                    }










                    setState(() {
                      showSpinner = true;
                    });

                    //final bool isValid = EmailValidator.validate(email);
                    if (_formKey.currentState.validate() && !existEmail) {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: emailAddress, password: password);

                        if (newUser != null) {
                          _firestore.collection("Users").add({
                            "email": emailAddress,
                            "username": username,
                            "password": password
                          }).then((value) {
                            print(value);
                          });

                          /*   Alert(
                            context: context,
                            type: AlertType.success,
                            title: "User added successfully!",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "add another user",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 80,
                                color: kPink,
                              ),
                              DialogButton(
                                child: Text(
                                  "Go back",
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                onPressed: () => Navigator.pushNamed(context, UserManagement.id),
                                width: 80,
                                color: kGreen,
                              ),
                            ],
                          ).show();*/

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('user added '),
                                backgroundColor: kGreen),
                          );

                          myControllerUsername.clear();
                          myControllerEmail.clear();
                        }

                        setState(() {
                          showSpinner = false;
                        });


                     /*   final Email email = Email(
                          body: 'You are invited yo join EnvaCalls, please use $password as your password',
                          subject: 'EnvaCalls',
                          recipients: ['mariamjawadi271@gmail.com'],
                          //cc: ['cc@example.com'],
                          //bcc: ['bcc@example.com'],
                          //attachmentPaths: ['/path/to/attachment.zip'],
                          isHTML: false,
                        );

                        await FlutterEmailSender.send(email);*/



                     /*   List<String> attachments = [];
                        bool isHTML = false;

                        final _recipientController = TextEditingController(
                          text: emailAddress,
                        );

                        final _subjectController = TextEditingController(text: 'Join EnvaCalls');

                        final _bodyController = TextEditingController(
                          text: 'You are invited yo join EnvaCalls, please use $password as your password',
                        );

                        Future<void> send() async {
                          final Email email = Email(
                            body:'You are invited yo join EnvaCalls, please use $password as your password',
                            subject:'Join EnvaCalls',
                            recipients: [emailAddress],
                            attachmentPaths: attachments,
                            isHTML: isHTML,
                          );

                          String platformResponse;

                          try {
                            await FlutterEmailSender.send(email);
                            platformResponse = 'success';
                          } catch (error) {
                            platformResponse = error.toString();
                          }

                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(platformResponse),
                            ),
                          );
                        }
*/






                        sendEmail();






                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('User already exists '),
                              backgroundColor: Colors.red),
                        );
                      }
                    }
                       else {





                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('User already exists '),
                            backgroundColor: Colors.red),
                      );




                    /* Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Unvalid Email !",
                        desc: "Please try again",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Go back",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                            color: kGreen,
                          )
                        ],
                      ).show();*/









                    }
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}

class GoogleAuthApi {

  static final _googleSignIn = GoogleSignIn(scopes: ['https://mail.google.com/']);

  static Future<GoogleSignInAccount> signIn() async {
    if (await _googleSignIn.isSignedIn()) {
      return _googleSignIn.currentUser;
    }
    else {
      return await _googleSignIn.signIn();
    }
  }



  static Future signOut()=> _googleSignIn.signOut();

}

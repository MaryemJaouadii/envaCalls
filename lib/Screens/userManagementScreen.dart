import 'package:try_salestrail/Screens/add_user.dart';
import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'callsInformationScreen.dart';
import 'package:searchfield/searchfield.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'recordingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement extends StatefulWidget {
  static const id = 'user_management';
  const UserManagement({Key key}) : super(key: key);

  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  final _firestore = FirebaseFirestore.instance;

  /* void usersStream() async {
    await for (var snapshot in _firestore.collection('Users').snapshots()) {
      for (var message in snapshot.docs) print(message.data()["email"]);
    }
  }*/

  List<String> emails = [];

  /* List<String> usersStream() async {
    await for (var snapshot in _firestore.collection('Users').snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data()["email"]);
        emails.add(message.data()["email"]);

      }
     // print(emails);


    }

    return emails;
  }
*/

  void usersStream() async {
    await for (var snapshot in _firestore.collection('Users').snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data()["email"]);
        emails.add(message.data()["email"]);
      }
      // print(emails);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // usersStream();
    usersStream();
    print(emails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBars(
         /* userPicture: 'profile.jpg',
          userName: 'Ian Miller',
          userEmail: 'ian_miller@gmail.com'*/
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
                  Navigator.pushNamed(context, RecordingScreen.id);
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
      body:Container(
       // height: _height,
       // width: _width,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 20.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        'User Management ',
                        style: kSubtitleStyle_purple.copyWith(fontSize: 23.0),
                      )),
                  GestureDetector(
                    child: Icon(
                      Icons.add,
                      size: 50.0,
                      color: kPink,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AddUser.id);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),







            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('Users').snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Column(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                    return Column(

                      children: [


                        //Text(data["username"]),
                        ContainerUserManagement(
                            pic: 'profilepic.jpeg',
                            username: '${data['username']}' ,
                            email: '${data['email']}'),
                      ],

                    );
                  }).toList(),
                );
              },
            ),

          ],
        ),
      ),



























    );
  }
}

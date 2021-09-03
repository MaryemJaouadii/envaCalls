import 'dart:io';

import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/edit_profile.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/components/user_preferences.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'callsInformationScreen.dart';
import 'package:searchfield/searchfield.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:try_salestrail/components/image_widget.dart';
import 'package:try_salestrail/constants.dart';
import 'package:try_salestrail/components/profile_widget.dart';
import 'package:try_salestrail/components/user.dart';

class ProfilePage extends StatefulWidget {
  static const id = 'profilepage';

  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBars(
      /*  userPicture: 'profilepic.jpeg',
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 48,
          ),
          ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                await Navigator.pushNamed(context, EditProfile.id);
                setState(() {});
              }),
          const SizedBox(
            height: 24,
          ),
          buildName(user),
          const SizedBox(
            height: 48,
          ),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

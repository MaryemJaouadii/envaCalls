import 'dart:async';

import 'package:try_salestrail/Screens/AddImage.dart';
import 'package:try_salestrail/Screens/add_team.dart';
import 'package:try_salestrail/Screens/add_user.dart';
import 'package:try_salestrail/Screens/callsInformationScreen.dart';
import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/callsInformationScreen.dart';
import 'package:try_salestrail/Screens/edit_profile.dart';
import 'package:try_salestrail/Screens/loginScreen.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/Screens/settings.dart';
import 'package:try_salestrail/Screens/userManagementScreen.dart';
import 'package:try_salestrail/components/phoneTextField.dart';
import 'package:try_salestrail/Screens/recordingScreen.dart';
import 'package:try_salestrail/Screens/teamManagementScreen.dart';
import 'package:try_salestrail/Screens/team_members.dart';
import 'package:try_salestrail/components/overViewComponents.dart';
import 'package:try_salestrail/components/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/registerScreen.dart';
import 'package:try_salestrail/Screens/AddImage.dart';


import 'package:try_salestrail/Screens/test.dart';
import 'package:try_salestrail/Screens/profile_page.dart';
import 'package:workmanager/workmanager.dart';
import 'package:call_log/call_log.dart';


/*
void callbackDispatcher() {
  Workmanager.executeTask((dynamic task, dynamic inputData) async {
    print('Background Services are Working!');
    try {
      final Iterable<CallLogEntry> cLog = await CallLog.get();
      print('Queried call log entries');
      for (CallLogEntry entry in cLog) {
        print('-------------------------------------');
        print('F. NUMBER  : ${entry.formattedNumber}');
        print('C.M. NUMBER: ${entry.cachedMatchedNumber}');
        print('NUMBER     : ${entry.number}');
        print('NAME       : ${entry.name}');
        print('TYPE       : ${entry.callType}');
        print('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp)}');
        print('DURATION   : ${entry.duration}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('ACCOUNT ID : ${entry.phoneAccountId}');
        print('SIM NAME   : ${entry.simDisplayName}');
        print('-------------------------------------');
      }
      return true;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      return true;
    }
  });
}*/



void main() async {



  WidgetsFlutterBinding.ensureInitialized();
  //Workmanager.initialize(callbackDispatcher, isInDebugMode: true);

  await Firebase.initializeApp();
  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      home:SplashScreen(),





    );
  }
}






class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(child:  Image.asset(
                  'images/logoo.png',
                  width: 300.0,

                ),
                ),

                Expanded(
                  child:  Image.asset(
                    'images/splash.png',

                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(child: Text('The best App to manage your time and organize your phone calls.' , style: kTextStyle2, textAlign: TextAlign.center,)),
              ],
            ),
          ),
        ));




  }
}




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EnvaCalls',
      theme: ThemeData(fontFamily: 'Lato'),
      initialRoute: LoginScreen.id,

      routes: {

        LoginScreen.id : (context) => LoginScreen(),
        RegisterScreen.id : (context) => RegisterScreen(),
        OverViewScreen.id : (context) => OverViewScreen(),
        CallsInformationScreen.id : (context) => CallsInformationScreen(),
        CallPerformanceScreen.id : (context) => CallPerformanceScreen(),
        RecordingScreen.id : (context) => RecordingScreen(),
        TeamManagementScreen.id : (context) => TeamManagementScreen(),
        AddTeam.id : (context) => AddTeam(),
        TeamMembers.id : (context) => TeamMembers(),
        UserManagement.id : (context) => UserManagement(),
        AddUser.id : (context) => AddUser(),
        Settings.id : (context) => Settings(),

        Test.id : (context) => Test(),
        NewScreen.id : (context) =>NewScreen(),
        ProfilePage.id : (context) => ProfilePage(),
        EditProfile.id : (context) => EditProfile(),




      },
    );
  }
}

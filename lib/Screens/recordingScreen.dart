import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'callsInformationScreen.dart';

class RecordingScreen extends StatefulWidget {

  static const id = 'recording_screen';


  const RecordingScreen({Key key}) : super(key: key);

  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {

  @override
  Widget build(BuildContext context) {
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
                  borderRadius:BorderRadius.only(topRight: Radius.circular(50.0)) ,
                  color: Colors.transparent,),
                child: UserAccountsDrawerHeader(

                  accountName: Text(
                    'Ian Miller'
                    , style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text('ianmiller@gmail.com', style: TextStyle(color: Colors.black),),
                  decoration: BoxDecoration( gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: kGradientBlue,
                  ),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50.0)),),
                  currentAccountPicture: new CircleAvatar(
                    radius: 50.0,
                    //backgroundColor: const Color(0xFF778899),
                    backgroundImage:
                    AssetImage("images/profilepic.jpeg"),

                  ),
                ),
              ),



              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.analytics),
                  title: Text('Analytics Overview',
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
                      style:kTextStyle3,
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
                  style:kTextStyle3,

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





      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Text('Recordings',style: kSubtitleStyle_purple,),
            ContainerRecording(user1: 'Ian', user2: 'Jessika', date: '27 Jan 2021', time: '2 min 3 sec')
          ],
        )
      ),


    );
  }
}

import 'package:try_salestrail/Screens/add_team.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/components/reusable_card.dart';
import 'package:try_salestrail/constants.dart';
import 'recordingScreen.dart';
import 'overviewScreen.dart';
import 'callPerformance.dart';
import 'package:try_salestrail/components/appBar.dart';


class TeamMembers extends StatefulWidget {

static const id='team_members';


  const TeamMembers({Key key}) : super(key: key);

  @override
  _TeamMembersState createState() => _TeamMembersState();
}

class _TeamMembersState extends State<TeamMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBars(
         // userPicture:'profile.jpg',userName: 'Ian Miller',userEmail:'ian_miller@gmail.com'
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
                  Navigator.pushNamed(context, RecordingScreen.id);
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


      body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top:20.0),
              child: Text('Web Development Team Members ',style: kSubtitleStyle_purple.copyWith(fontSize: 20.0),),
            ),
            SizedBox(
              height: 20.0,
            ),
            ContainerTeamMembers(pic: 'profilepic.jpeg', username: 'Ian Miller', email: 'ianmiller@gmail.com'),
            ContainerTeamMembers(pic: 'profilepic.jpeg', username: 'Ian Miller', email: 'ianmiller@gmail.com'),
            ContainerTeamMembers(pic: 'profilepic.jpeg', username: 'Ian Miller', email: 'ianmiller@gmail.com'),
            ContainerTeamMembers(pic: 'profilepic.jpeg', username: 'Ian Miller', email: 'ianmiller@gmail.com'),

          ]),
    );
  }
}






import 'package:try_salestrail/Screens/add_team.dart';
import 'package:try_salestrail/Screens/team_members.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/components/reusable_card.dart';
import 'package:try_salestrail/constants.dart';
import 'recordingScreen.dart';
import 'overviewScreen.dart';
import 'callPerformance.dart';
import 'package:try_salestrail/components/appBar.dart';

class TeamManagementScreen extends StatefulWidget {
  static const id = 'team_management';

  const TeamManagementScreen({Key key}) : super(key: key);

  @override
  _TeamManagementScreenState createState() => _TeamManagementScreenState();
}

class _TeamManagementScreenState extends State<TeamManagementScreen> {
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
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.people),
                  title: Text(
                    'Team Management',
                    style: kTextStyle3,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'User Management',
                    style: kTextStyle3,
                  ),
                ),
                onTap: () {
                  //Navigator.pushNamed(context, );
                },
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
        children: [

          Padding( padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Team Management' , style: kSubtitleStyle_purple , textAlign: TextAlign.start,),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Your Teams', style: TextStyle(color: kPink,fontSize: 22.0, fontWeight: FontWeight.bold),),
                ],
              )),

          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [


          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {

                    Navigator.pushNamed(context, TeamMembers.id);


                  },
                  child: ReusableCard(
                    deco: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: kGradientBlue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    widget: Text(
                      'Web Develoment Team',style: kTextInsideCard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: ReusableCard(
                    deco: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: kGradientBlue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    widget: Text(
                      'Web Develoment Team',style: kTextInsideCard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: ReusableCard(
                    deco: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: kGradientBlue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    widget: Text(
                      'Web Develoment Team',style: kTextInsideCard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: ReusableCard(
                    deco: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: kGradientBlue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    widget: Text(
                      'Web Develoment Team ', style: kTextInsideCard,
                    textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: ReusableCard(
                    deco: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: kGradientBlue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    widget: Text(
                      'Web Develoment Team', style: kTextInsideCard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: ReusableCard(
                    deco: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    widget: GestureDetector(
                      child: Column(
                        children: [
                          Icon(Icons.add , color: Color(0xFF2980EB), size: 60.0,),
                          Text('Add Team', style: TextStyle(color: Color(0xFF2980EB),), )
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, AddTeam.id);
                      },
                    )
                  ),
                ),
              ),

            ],
          ),
            ],
          ),
        ],
      ),
    );
  }
}

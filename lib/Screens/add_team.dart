import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'callsInformationScreen.dart';
import 'package:searchfield/searchfield.dart';
import 'package:try_salestrail/components/rounded_button.dart';
//import 'package:flutter_search_bar/flutter_search_bar.dart';


class AddTeam extends StatefulWidget {

  static const id='add_team';

  const AddTeam({Key key}) : super(key: key);

  @override
  _AddTeamState createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
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
                  decoration: BoxDecoration(

                    /*gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: kGradientBlue,
                  ),*/
                    color: Color(0xFF1F1760),
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





      body:  ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top:20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Team Management' , style: kSubtitleStyle_purple.copyWith(fontSize: 25.0), textAlign: TextAlign.start,),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Create a team', style: TextStyle(color: kPink,fontSize: 20.0, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('For people whose calls you want to track.', style: TextStyle(fontSize: 17.0),),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name your team' , style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18.0),),
                  SizedBox(
                    height: 10.0,
                  ),
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
                      hintText: 'Enter your team name',
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Add team members' , style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18.0),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SearchField(

                    searchInputDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGreen, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'search members by email',
                    ),


                    suggestions: [
                      'United States',
                      'America',
                      'Washington',
                      'India',
                      'Paris',
                      'Jakarta',
                      'Australia',
                      'Lorem Ipsum'
                    ],
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Add users who can see this team’s call tracks' , style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18.0),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SearchField(

                    searchInputDecoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGreen, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'search members by email',
                    ),


                    suggestions: [
                      'United States',
                      'America',
                      'Washington',
                      'India',
                      'Paris',
                      'Jakarta',
                      'Australia',
                      'Lorem Ipsum'
                    ],
                  ),






                ],


              ),

            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedSubmitButton( text :'Create Team', onPress: () {}),
                ],
              ),
            ),

          ]

      ),


    );
  }
}

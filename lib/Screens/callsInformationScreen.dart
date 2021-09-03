import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'recordingScreen.dart';

class CallsInformationScreen extends StatefulWidget {

  static const id = 'callinfo_screen';



  const CallsInformationScreen({Key key}) : super(key: key);

  @override
  _CallsInformationScreenState createState() => _CallsInformationScreenState();
}

class _CallsInformationScreenState extends State<CallsInformationScreen> {
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
                    Navigator.pushNamed(context, CallsInformationScreen.id);
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
        padding: const EdgeInsets.all(8.0),
        child: Text('Call informations ',style: kSubtitleStyle_purple,),
      ),
      ContainerCallInformations(legend: 'User ID : ', data: '24f-876-sj5-ad-789'),
      ContainerCallInformations(legend: 'UserName : ', data: 'akame'),
      ContainerCallInformations(legend: 'User Email : ', data: 'akame1Tatsume@gmail.com'),
      ContainerCallInformations(legend: 'User Phone : ', data: '+261 58915786'),
      ContainerCallInformations(legend: 'Call ID : ', data: '24f-876-sj5-ad-789'),
      ContainerCallInformations(legend: 'Source : ', data: 'Android'),
      ContainerCallInformations(legend: 'Source Detail : ', data: 'SIM'),
      ContainerCallInformations(legend: 'Date : ', data: '8 March 2020'),
      ContainerCallInformations(legend: 'Time : ', data: '02:15:38 pm'),
      ContainerCallInformations(legend: 'Time Zone : ', data: 'UTC'),
      ContainerCallInformations(legend: 'Duration : ', data: '0 min 0 sec'),
      ContainerCallInformations(legend: 'Answered : ', data: '0 min 0 sec'),
      ContainerCallInformations(legend: 'Number : ', data: '261 58915786'),

      ContainerCallInformations(legend: 'Is Integrated : ', data: '0'),

    ]),
    );
  }
}

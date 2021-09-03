import 'package:try_salestrail/Screens/callsInformationScreen.dart';
import 'package:try_salestrail/Screens/recordingScreen.dart';
import 'package:try_salestrail/Screens/teamManagementScreen.dart';
import 'package:try_salestrail/Screens/userManagementScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/datePicker.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/constants.dart';
import 'package:try_salestrail/components/overViewComponents.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'callPerformance.dart';
import 'settings.dart';
import 'add_team.dart';
import 'add_user.dart';
List<String> userList = ['all', 'Ian Miller', 'Jessika'];
class OverViewScreen extends StatefulWidget {
  static const id = 'overview_screen';


  @override
  _OverViewScreenState createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {

  String selectedValueDateRange = periodsList[0];
  String selectedValueCustom = customList[0];
  String selectedValueDuration = durationList[0];
  String selectedValueUser = userList[0];

  DropdownButton<String> customDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String customText in customList) {
      String custom = customText;
      var newItem = DropdownMenuItem(
        child: Text(custom),
        value: custom,

      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedValueCustom,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedValueCustom = value;
        });
      },
    );
  }

  DropdownButton<String> DateRangeDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String itemText in periodsList) {
      String period = itemText;
      var newItem = DropdownMenuItem(
        child: Text(period),
        value: period,
      );
      dropdownItems.add((newItem));
    }

    return DropdownButton<String>(
      value: selectedValueDateRange,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedValueDateRange = value;
        });
      },
    );
  }

  DropdownButton<String> durationDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String durationText in durationList) {
      String duration = durationText;
      var newItem = DropdownMenuItem(
        child: Text(duration),
        value: duration,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedValueDuration,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedValueDuration = value;
        });
      },
    );
  }

  DropdownButton<String> userDropDown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String userText in userList) {
      String user = userText;
      var newItem = DropdownMenuItem(
        child: Text(user),
        value: user,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedValueUser,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedValueUser = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.pop(context);
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
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.people),
                  title: Text(
                    'Team Management',
                    style: kTextStyle3,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, TeamManagementScreen.id);
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
                  Navigator.pushNamed(context, UserManagement.id);
                },
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: kTextStyle3,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Settings.id);
                },
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
          children: <Widget>[
            Container(
              decoration: kBottomBorderForContainer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 7,
                          child: Text(
                            'Analytics Overview',
                            style: kSubtitleStyle_purple,
                          )),
                      Expanded(
                          flex: 3,
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildPopupDialog(context),
                              );
                            },
                            icon: Icon(
                              Icons.filter_alt_sharp,
                              size: 40.0,
                            ),
                            tooltip: 'filter',
                            color: Color(0xFF0ECAB4),
                            highlightColor: Color(0xFF14C7B1),
                            hoverColor: Color(0xFFA7F1F1),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ContainerBuild(
                          cardChild: Column(
                            children: [
                              Text(
                                '123',
                                style: kBoldNumberStyle,
                              ),
                              Text(
                                'Calls',
                                style: kTextStyle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ContainerBuild(
                          cardChild: Column(
                            children: [
                              Text(
                                '84',
                                textAlign: TextAlign.center,
                                style: kBoldNumberStyle,
                              ),
                              Text(
                                'Outbound Calls',
                                textAlign: TextAlign.center,
                                style: kTextStyle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ContainerBuild(
                          cardChild: Column(
                            children: [
                              Text(
                                '39',
                                style: kBoldNumberStyle,
                              ),
                              Text(
                                'Inbound Calls',
                                textAlign: TextAlign.center,
                                style: kTextStyle1,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: kBottomBorderForContainer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Most Active Hour By Calls',
                    style: kSubtitleStyle_purple,
                  ),
                  Container(
                      child: HoursCallChart(
                    chartData: <ChartData>[
                      ChartData('Jan', 40),
                      ChartData('Feb', 25),
                      ChartData('Mar', 40),
                      ChartData('Apr', 60),
                      ChartData('May', 35)
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                decoration: kBottomBorderForContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Top Performers By Outbound Calls',
                      style: kSubtitleStyle_purple,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Performer(
                            rank: Image(
                              image: AssetImage('images/cup.png'),
                            ),
                            userName: 'Miles Morakes',
                            callsNumber: '52',
                          ),
                          Performer(
                              rank: Text(
                                '2nd',
                                style: kTextStyle2,
                              ),
                              userName: 'Miles Morakes',
                              callsNumber: '52'),
                          Performer(
                              rank: Text(
                                '3rd',
                                style: kTextStyle2,
                              ),
                              userName: 'Miles Morakes',
                              callsNumber: '52'),
                          Performer(
                              rank: Text(
                                '4th',
                                style: kTextStyle2,
                              ),
                              userName: 'Miles Morakes',
                              callsNumber: '52'),
                          Performer(
                              rank: Text(
                                '5th',
                                style: kTextStyle2,
                              ),
                              userName: 'Miles Morakes',
                              callsNumber: '52'),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Connection Rate Overtime',
                    style: kSubtitleStyle_purple,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      child: ConnectionRateChart(
                    chartDataForAnswered: <ChartData>[
                      ChartData('Jan', 40),
                      ChartData('Feb', 25),
                      ChartData('Mar', 40),
                      ChartData('Apr', 60),
                      ChartData('May', 35)
                    ],
                    chartDataForUnAnswered: <ChartData>[
                      ChartData('Jan', 40),
                      ChartData('Feb', 25),
                      ChartData('Mar', 40),
                      ChartData('Apr', 60),
                      ChartData('May', 35)
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  final now = DateTime.now();
  return AlertDialog(
    title: Container(
        decoration: kBottomBorderForContainer,
        child: Text(
          'Filter',
          style: kTextStyle2,
        )),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
            decoration: kBottomBorderForContainer,
            child: Text("Date range", style: kTextStyle1.copyWith(color: kPurple))),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  'specified :',
                  style: kTextStyle3.copyWith(fontSize:17,fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                flex:5,
                child: Text(
                  'custom :',
                  style: kTextStyle3.copyWith(fontSize:17,fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),

        Row(
          children: [
            RoundedContainer(content: _OverViewScreenState().DateRangeDropDown()),

            RoundedContainer(content:_OverViewScreenState().customDropDown()),
          ],
        ),
        Text("Duration", style: kTextStyle1.copyWith(color: kPurple)),
        RoundedContainer(content: _OverViewScreenState().durationDropDown()),
        Text("User", style: kTextStyle1.copyWith(color: kPurple)),
    RoundedContainer(content:_OverViewScreenState().userDropDown()),
      ],
    ),
    actions: <Widget>[

      IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.exit_to_app,color: kGreen,size: 30,),
      ),
    ],
  );
}

import 'package:call_log/call_log.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/phoneTextField.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'recordingScreen.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:try_salestrail/components/callLog.dart';


class CallPerformanceScreen extends StatefulWidget {

  static const id = 'callPerformance_screen';


  const CallPerformanceScreen({Key key}) : super(key: key);

  @override
  _CallPerformanceScreenState createState() => _CallPerformanceScreenState();
}

class _CallPerformanceScreenState extends State<CallPerformanceScreen> with WidgetsBindingObserver {



  openPhonelogs(){
    Navigator.pushNamed(context, CallPerformanceScreen.id);
  }

  checkpermission_phone_logs() async{
    if(await Permission.phone.request().isGranted){
      openPhonelogs();
    }else {
      showToast("Provide Phone permission to make a call and view logs.", position: ToastPosition.bottom);
    }
  }


  //Iterable<CallLogEntry> entries;
  PhoneNumber pt = new PhoneNumber();
  CallLogs cl = new CallLogs();

   AppLifecycleState _notification;
   Future<Iterable<CallLogEntry>> logs;



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkpermission_phone_logs();

    WidgetsBinding.instance.addObserver(this);
    logs = cl.getCallLogs();
  }



  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (AppLifecycleState.resumed == state){
      setState(() {
        logs = cl.getCallLogs();
      });
    }

  }




  @override
  Widget build(BuildContext context) {
final controller=ScrollController();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:AppBars(
      /*  userPicture: 'profilepic.jpeg',
        userName: 'Ian Miller',
        userEmail: 'ianmiller@gmail.com',*/
      ) ,



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

                  Navigator.pop(context, OverViewScreen.id);
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
                    Navigator.pop(context);
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





      body:

      Column(
        children: [
          PhoneNumber(),
          //TextField(controller: t1, decoration: InputDecoration(labelText: "Phone number", contentPadding: EdgeInsets.all(10), suffixIcon: IconButton(icon: Icon(Icons.phone), onPressed: (){print("pressed");})),keyboardType: TextInputType.phone, textInputAction: TextInputAction.done, onSubmitted: (value) => call(value),),
          FutureBuilder(future:  logs,builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              Iterable<CallLogEntry> entries = snapshot.data;
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index){

                  return GestureDetector( child: Card(
                    child: ListTile(
                      leading: cl.getAvator(entries.elementAt(index).callType),
                      title: cl.getTitle(entries.elementAt(index)),
                      subtitle: Text(cl.formatDate(new DateTime.fromMillisecondsSinceEpoch(entries.elementAt(index).timestamp)) + "\n" + cl.getTime(entries.elementAt(index).duration)),
                      isThreeLine: true,
                      trailing: IconButton(icon: Icon(Icons.phone), color: Colors.green, onPressed: (){
                        cl.call(entries.elementAt(index).number);
                      }),
                    ),
                  ), onLongPress: () => pt.update(entries.elementAt(index).number.toString()),
                  );
                }, itemCount: entries.length,

                ),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          })






        ],
      ),





      /*

      ListView(
        controller: controller,
        padding: EdgeInsets.all(8.0),
      children: [
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Call Performance',
          style: kSubtitleStyle_purple,
        ),
      ),
       PhoneNumber(),
       /*
       ContainerCallPerformance(userName: 'Jessika', dateOfCall: '15 Feb 2020', timeOfCall: '17:32:14', durationOfCall: '2 min 3 sec'),
        ContainerCallPerformance(userName: 'Jessika', dateOfCall: '15 Feb 2020', timeOfCall: '17:32:14', durationOfCall: '2 min 3 sec'),
        ContainerCallPerformance(userName: 'Jessika', dateOfCall: '15 Feb 2020', timeOfCall: '17:32:14', durationOfCall: '2 min 3 sec'),
        ContainerCallPerformance(userName: 'Jessika', dateOfCall: '15 Feb 2020', timeOfCall: '17:32:14', durationOfCall: '2 min 3 sec'),
        ContainerCallPerformance(userName: 'Jessika', dateOfCall: '15 Feb 2020', timeOfCall: '17:32:14', durationOfCall: '2 min 3 sec'),
        ContainerCallPerformance(userName: 'Jessika', dateOfCall: '15 Feb 2020', timeOfCall: '17:32:14', durationOfCall: '2 min 3 sec'),
      */

        FutureBuilder(future:  logs,builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            Object? entries = snapshot.data;
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index){

                return GestureDetector( child: Card(
                  child: ListTile(
                    leading: cl.getType(entries!.elementAt(index).callType),
                    title: cl.getName(entries.elementAt(index)),
                    subtitle: Text(cl.formatDate(new DateTime.fromMillisecondsSinceEpoch(entries.elementAt(index).timestamp)) + "\n" + cl.getTime(entries.elementAt(index).duration)),
                    isThreeLine: true,
                    trailing: IconButton(icon: Icon(Icons.phone), color: Colors.green, onPressed: (){
                      cl.call(entries.elementAt(index).number);
                    }),
                  ),
                ), onLongPress: () => pt.update(entries.elementAt(index).number.toString()),
                );
              }, itemCount: entries.length,

              ),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        })



      ],

    ),*/

      floatingActionButton: FloatingActionButton(
        backgroundColor: kBackgroundColor,
        child: Icon(Icons.keyboard,color: kPink,size: 35,),
        onPressed: (){controller.jumpTo(0.0);},
      ),
    );
  }
}

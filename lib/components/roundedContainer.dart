import 'package:try_salestrail/Screens/callsInformationScreen.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:searchfield/searchfield.dart';


class RoundedContainer extends StatelessWidget {
  RoundedContainer({ this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(

        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: content
        ),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(color: Color(0xFFE7E7E5)),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}


//Call Informations
class ContainerCallInformations extends StatelessWidget {
  ContainerCallInformations({ this.legend, this.data});

  final String legend;
  final String data;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(content:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Expanded(flex:4,child: Text(legend,style: kTextStyle2.copyWith(color: kLightGreen,fontSize: 18))),
          Expanded(flex:7,child:Text(data,style: TextStyle(color:Colors.black87,fontSize: 17.0,fontWeight: FontWeight.w400)))]
    ),);
  }
}

//Records
class ContainerRecording extends StatelessWidget {
  const ContainerRecording({this.user1, this.user2, this.date, this.time}) ;
  final String user1;
  final String user2;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(content: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Expanded(
          flex: 7,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user1+'&'+user2,style: kTextStyle2,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Padding(
                     padding: const EdgeInsets.all(7.0),
                     child: Text(date,style:kDateTextStyle),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(time,style:kTimeTextStyle),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(flex:2,child: IconButton(onPressed: (){}, icon: Icon(Icons.mic,color: kLightGreen,size: 35,)))
      ],
    ));
  }
}

//Call Performance
class ContainerCallPerformance extends StatelessWidget {
  ContainerCallPerformance({this.userName,this.dateOfCall,this.timeOfCall,this.durationOfCall});
String userName;
String durationOfCall;
String timeOfCall;
String dateOfCall;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(content: Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Icon(Icons.phone_forwarded,color: Color(0xFF00B526),size: 35,),
        Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10.0,right:10.0),
              child: Text(userName,style: kTextStyle2,),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(dateOfCall,style:kDateTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(timeOfCall,style:kTimeTextStyle),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Text(durationOfCall,style:kTimeTextStyle),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pushNamed(context, CallsInformationScreen.id);
              },
                  icon: Icon(Icons.info,color: kPink,size: 35,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.phone,color: kLightGreen
                ,size: 35,))
            ],
          ),
        )
      ],
    ));
  }
}

class ContainerTeamMembers extends StatelessWidget {

ContainerTeamMembers({  this.pic , this.username ,  this.email  });


  final String pic ;
  final String username;
  final String email;




  @override
  Widget build(BuildContext context) {
    return RoundedContainer(content: Row(

      children: [

        CircleAvatar(
          backgroundImage: AssetImage('images/'+pic),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              Text(email),
            ],
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Icon(Icons.arrow_circle_up , color: kPink,),
          Icon(Icons.delete , color: Color(0xFF09D2B5),),
        ],
        ),



      ],



    ));
  }
}



class ContainerUserManagement extends StatelessWidget {

  ContainerUserManagement({  this.pic , this.username , this.email  });


  final String pic ;
  final String username;
  final String email;




  @override
  Widget build(BuildContext context) {
    return RoundedContainer(content: Row(

      children: [

        CircleAvatar(
          backgroundImage: AssetImage('images/'+pic),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username , style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black,decoration:TextDecoration.none),),
              Text(email, style: TextStyle(fontSize: 18.0, color: Colors.black38 , decoration:TextDecoration.none ),),
            ],
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Icon(Icons.delete , color: Color(0xFF09D2B5),),
          ],
        ),



      ],



    ));
  }
}

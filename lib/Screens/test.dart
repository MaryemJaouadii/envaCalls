import 'package:try_salestrail/Screens/add_user.dart';
import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'callsInformationScreen.dart';
import 'package:searchfield/searchfield.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'recordingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';









class Test extends StatefulWidget {
  static const id= 'test';
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {


  final _firestore = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('Users').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return Column(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
                  return Column(

                    children: [


                      //Text(data["username"]),
                      ContainerUserManagement(
                          pic: 'profilepic.jpeg',
                          username: '${data['username']}' ,
                          email: '${data['email']}'),
                    ],

                  );
                }).toList(),
              );
            },
          ),
        ],
      ),

















     /* StreamBuilder(
        stream: _firestore.collection('Users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          if (snapshot.hasData) {
            final data = snapshot.requireData;

            return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return ContainerUserManagement(
             pic: 'profilepic.jpeg',
            username: '${data
                      .docs[index]['username']}' ,
             email: '${data
                       .docs[index]['email']}');
                });
          }
          throw (e) {};
        },

      ),*/
    );
  }
}

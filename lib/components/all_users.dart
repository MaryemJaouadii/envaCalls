import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AllUsers {
  final _firestore = FirebaseFirestore.instance;
  List<String> emails = [];


  final String email='';


 /* void getUsers() async {
    final users = await _firestore.collection("Users").getDocuments();
    for (var user in users.documents) {
      //print(user.data["email"]);
      emails.add(user.data["email"]);
    }
  }



  void printAllEmails () {
    for ( var email in emails) {
      print(email);
    }
  }

*/



  void usersStream() async {
    await for (var snapshot in _firestore.collection('Users').snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data()["email"]);
        emails.add(message.data()["email"]);

      }
      print(emails);

    }
  }















}

// version m9assma :


import 'package:try_salestrail/components/profile_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/components/user.dart';
import 'package:try_salestrail/components/user_preferences.dart';
import 'package:try_salestrail/constants.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/textfield_widget.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfile extends StatefulWidget {
  static const id='editprofile';

  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

//  User user = UserPreferences.myUser;



/*
  File? image;

  Future pickImage(ImageSource source ) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;


      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    }

    on PlatformException catch (e) {
      print('Failed to pick image $e');
    }

  }
*/

   User user;
  PickedFile image;
  File file;
  String url="";
  final _firestore = FirebaseFirestore.instance;

  getImage () async {
    image = await ImagePicker().getImage(source: ImageSource.gallery);

    if (image == null) return;
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(image.path);
    final imageFile = File('${directory.path}/$name');
    final newImage = await File(image.path).copy(imageFile.path);

    setState(() => user=user.copy(imagePath: newImage.path));


  }

  uploadFile () async {

    file=File(image.path);
    var imageFileee = FirebaseStorage.instance.ref().child("path").child("/.jpg");
    UploadTask task = imageFileee.putFile(file);
    TaskSnapshot snapshot = await task;

    //for downloading:
    url =  await snapshot.ref.getDownloadURL();
    print(url);

  /*  _firestore.collection("Users").where("email==${user.email}").add({
      "image":url
    }).then((value) {
      print(value);
    });*/




  }



  updateCollection () async {

    try {

      _firestore.collection("Users").where("email==${user.email}").get().then((value) => print("nchallah yatla3 l id = $value"));


    /*  _firestore.collection("Users").where("email==${user.email}").update({
        "email": user.email,
        "username": user.username,
        "image": url,
      }).then((value) {
        print(value);
      });

      print('added to firestore');*/
    }
    catch(e) {
      print("could not add to firestore because of $e");
    }

  }



  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> updateUser() {
    return users
        .doc('2zPFgwsaggts7CnDuzC6')
        .update({"username": 'try update'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = UserPreferences.getUser();

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBars(
        /* userPicture: 'profilepic.jpeg',
        userName: 'Ian Miller',
        userEmail: 'ianmiller@gmail.com',*/
      ),

      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 48,),
          ProfileWidget(imagePath: user.imagePath,
              isEdit: true ,
              onClicked:() {

                getImage ();
                /* final image = await ImagePicker().getImage(source: ImageSource.gallery);

                if (image == null) return;
                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);

*/

                /*   file=File(image.path);
                var imageFileee = FirebaseStorage.instance.ref().child("path").child("/.jpg");
                UploadTask task = imageFileee.putFile(file!);
                TaskSnapshot snapshot = await task;

                //for downloading:
                url =  await snapshot.ref.getDownloadURL();
                print(url);
*/


                //  setState(() => user=user.copy(imagePath: newImage.path));



              }
          ),
          const SizedBox(height: 24,),
          TextFieldWidget(
            label : 'Username',
            text: user.username,
            onChanged:(username) => user=user.copy(username:username),
            // it still needs to be changed in firebase also!!!!!!!!!!!!!!
          ),
          const SizedBox(height: 24,),
          TextFieldWidget(
            label : 'Email',
            text: user.email,
            onChanged:(email) {

              // did not make a change yet , still don't know how to change it in firebase also!!!!!!!!!!

            },
          ),
          const SizedBox(height: 24,),
          TextFieldWidget(
            label : 'About',
            text: user.about,
            maxLines:3,
            onChanged:(about) => user=user.copy(about: about),
            // it still needs to be changed in firebase also !!!!!!!!!!
          ),




          RoundedSubmitButton(
              text: 'save changes',
              onPress: () async {

                try {
                  uploadFile();
                  updateCollection();
                  updateUser();
                  UserPreferences.setUser(user);
                  Navigator.of(context).pop();


                } catch (e) {
                  print(e);

                }
              }

          ),



        ],
      ) ,
    );
  }
}



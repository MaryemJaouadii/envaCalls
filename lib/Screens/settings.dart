
import 'dart:io';

import 'package:try_salestrail/Screens/callPerformance.dart';
import 'package:try_salestrail/Screens/overviewScreen.dart';
import 'package:try_salestrail/components/appBar.dart';
import 'package:try_salestrail/components/roundedContainer.dart';
import 'package:try_salestrail/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'callsInformationScreen.dart';
import 'package:searchfield/searchfield.dart';
import 'package:try_salestrail/components/rounded_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:try_salestrail/components/image_widget.dart';
import 'package:try_salestrail/constants.dart';



class Settings extends StatefulWidget {
  static const String id= 'settings';


  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {




/*  final ImagePicker _picker = ImagePicker();
  // Pick an image
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  // Capture a photo
  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
*/


// Image Picker
 /* List<File> _images = [];
  File _image; // Used only if you need a single picture

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;
    // Let user select photo from gallery
    if(gallery) {
      pickedFile = (await picker.getImage(
        source: ImageSource.gallery,))!;
    }
    // Otherwise open camera to get new photo
    else{
      pickedFile = (await picker.getImage(
        source: ImageSource.camera,))!;
    }

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path,));
        //_image = File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }*/

File image;

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













  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBars(
     /*   userPicture: 'profilepic.jpeg',
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
                  Text('Settings' , style: kSubtitleStyle_purple.copyWith(fontSize: 25.0), textAlign: TextAlign.start,),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),



            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 // Spacer(),
               image != null ? ImageWidget(
                 image: image,
                 onClicked: (source) => pickImage(ImageSource.gallery)
               ) : GestureDetector(child:ClipOval(
                 child:  Material(  color: Colors.transparent,child: Image.asset('images/anonymous.jpg' ,height: 160, width: 160 , fit: BoxFit.fill,)),




    ) ,onTap: () {

                 ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(
                       content: Text('Please pick a method to choose a picture'),
                       backgroundColor: kPink),
                 );

               }

               ) ,
               /*  Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      //backgroundColor: const Color(0xFF778899),
                      backgroundImage:
                      AssetImage("images/profilepic.jpeg"),

                    ),
                  ),*/


                  SizedBox(height: 20.0,),
               BuildButton(title: 'pick from gallery', icon: Icons.photo, onClicked: ()=> pickImage(ImageSource.gallery)),
               SizedBox(height: 20.0,),
               BuildButton(title: 'pick from camera', icon: Icons.camera_alt_outlined, onClicked: ()=> pickImage(ImageSource.camera)),















                ],


              ),

            ),


          ],

      ),


    );
  }
















}

class BuildButton extends StatelessWidget {

  BuildButton({ this.title ,  this.icon,  this.onClicked});

  final String title;
  final IconData icon;
  final VoidCallback onClicked;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle: TextStyle(fontSize: 20.0),

      ),

      child: Row(
        children: [
          Icon(icon ,size: 28.0,),
          const SizedBox(width: 16,),
          Text(title),

        ],

      ),
      onPressed:onClicked ,


    );
  }
}

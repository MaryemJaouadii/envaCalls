import 'package:try_salestrail/Screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:try_salestrail/constants.dart';
import 'package:try_salestrail/components/user_preferences.dart';
import 'package:try_salestrail/components/appBar_widget.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);
  /*AppBars(
      {required this.userName,
      required this.userPicture,
      required this.userEmail});
  String userName;
  String userPicture;
  String userEmail;
*/
  @override
  Widget build(BuildContext context) {

    final user=UserPreferences.getUser();



    return AppBar(
      backgroundColor: kBackgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(user.username,style: TextStyle(color: kPink,fontSize: 20.0 , fontWeight: FontWeight.bold),),
          Text(user.email, style: TextStyle(fontSize: 16.0, color: Colors.black ),)
        ],
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0 , top: 7.0),

        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.baseline,

        /*child: CircleAvatar(
          backgroundImage: AssetImage('images/'+userPicture),

        ),*/
        child: AppBarWidget(
        imagePath: user.imagePath,
    onClicked: () async {
      await Navigator.pushNamed(context, ProfilePage.id);
    }


        ),
      ),
    );
  }
}

/*


    child: ClipRRect(
               child: Image(
                  alignment: Alignment.center,
                  width: 250.0,
                    height: 250.0,
                    image:AssetImage('images/'+userPicture)
                ),
                borderRadius:BorderRadius.all(Radius.circular(45)),
              ),


 */

/*


child:Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                CircleAvatar(
          backgroundImage: AssetImage('images/'+userPicture),
                ),

                SizedBox(
                  width: 20.0,
                ),


                Text(userName,style: TextStyle(color: kPink,fontSize: 24.0),),

              ],
            ),



 */

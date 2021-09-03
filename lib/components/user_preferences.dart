import 'dart:convert';

import 'package:try_salestrail/components/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {


  static  SharedPreferences _preferences;


  static const _keyUser='user';
  static const myUser = User(

    imagePath: 'https://www.booksie.com/files/profiles/22/mr-anonymous.png',
    username: 'Maryem Jaouadi',
    email: 'mariamjawadi273@gmail.com',
    about: 'Software engineering student at ISSATSo, Flutter developper intern at Envast',
      isDarkMode: false,

  );


  static Future init() async => _preferences = await SharedPreferences.getInstance();


  static Future setUser(User user) async {
    final json= jsonEncode(user.toJson());
    await _preferences.setString(_keyUser,json);

  }


  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json ==null? myUser :User.fromJson(jsonDecode(json));

  }

}
import 'package:try_salestrail/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({  this.text,  this.onPress});

  String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(

        decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: kGradientBlue)
        ),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text,
              style: TextStyle(
               // fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25.0,
              )),
        ),
      ),
    );
  }
}




class RoundedSubmitButton extends StatelessWidget {
  RoundedSubmitButton({ this.text, this.onPress});

  String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(

        decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: kGradientPink)
        ),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 300.0,
          height: 42.0,
          child: Text(text,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }
}


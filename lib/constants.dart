import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Colors
const kBackgroundColor = Color(0xFFF6F7FB);
const kPurple = Color(0xFF2D258E);
const kPink = Color(0xFFF956A0);
const kGrey = Color(0xFF848BA4);
const kGreen = Color(0xFF09D2B5);
const kAccentGrey = Color(0xFF494F57);
const kLightGreen = Color(0xFF09D2B5);
const kGradientBlue = [Color(0xFF2980EB), Color(0xFF54DAE6)];
const kGradientPink = [Color(0xFFC86DEB), Color(0xFFFF95493)];

//Text styles

const kSubtitleStyle_purple = TextStyle(
    fontFamily: 'fonts/lato-Bold',
    color: kPurple,
    fontSize: 30.0,
    fontWeight: FontWeight.w500);
const kBoldNumberStyle = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 35.0,
); //used in cards data(number)
const kTextStyle1 = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
  color: kAccentGrey,
); //used in cards legend
const kTextStyle2 = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: kAccentGrey,
); //used in call Performers
const kDateTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
);
const kTimeTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w300,
  color: kAccentGrey,
);

const kTextStyle3 = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: kAccentGrey,
); //used in drawer items

//Decorations
const kBottomBorderForContainer = const BoxDecoration(
    border: Border(bottom: BorderSide(color: Colors.black26)));



const kTextFieldDecoration = InputDecoration(
  hintText: 'Type your message here...',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kGreen, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);



/*const kTextFieldDecoration = InputDecoration(
  hintText: 'Type your message here...',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFA2A8C7), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFA2A8C7), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);*/

const kTextInsideCard =
TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

//lists for filtering
const List<String> periodsList = [
  'Today',
  'Yesterday',
  'This week',
  'This month',
  'This year'
];
const List<String> customList = [
  'Date',
  'Period',
];
const List<String> durationList = [
  'Less than 1 min',
  'Between 1 min and 5 min',
  'More than 5 min'
];

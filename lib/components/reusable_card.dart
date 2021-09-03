import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({ this.deco ,  this.widget});

  final BoxDecoration deco;
  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: widget,
      margin: EdgeInsets.all(15.0),
      decoration: deco,

    );
  }
}

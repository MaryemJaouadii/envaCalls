import 'dart:io';
import 'package:flutter/material.dart';
import 'package:try_salestrail/constants.dart';


class AppBarWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;


  const AppBarWidget({
    Key key,
     this.imagePath,
    this.isEdit = false,
    this.onClicked
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme.primary;


    return buildImage();

  }

  Widget buildImage() {
    final image = imagePath.contains('https://')?NetworkImage(imagePath) : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
          child: InkWell(onTap: onClicked),

        ),
      ),
    );

  }






}

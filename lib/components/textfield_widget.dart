import 'package:flutter/material.dart';


class TextFieldWidget extends StatefulWidget {


  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key key,

    this.maxLines=1,
     this.label,
     this.text,
     this.onChanged,

  }) : super(key:key) ;

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  TextEditingController controller;


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TextEditingController(text: widget.text);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) =>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(height: 8,),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
      ),
    ],
  );
}

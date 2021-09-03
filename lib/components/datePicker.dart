import 'package:flutter/material.dart';
class DatePicker extends StatefulWidget {
  //Date_picker({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2021, 7), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          onPressed: () => _selectDate(context),
          color: Color(0xFF3ACCE1),
          icon: Icon(Icons.event),
        ),
        SizedBox(
          height: 20.0,
        ),
        /*  Text(
          "${selectedDate.toLocal()}".split(' ')[0],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),*/
      ],
    );
  }
}
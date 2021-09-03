
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:try_salestrail/components/callLog.dart';

import '../constants.dart';

/*class PhoneNumber extends StatefulWidget {

  const PhoneNumber({Key key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {


  @override
  Widget build(BuildContext context) {
    String phoneNumber;
    final myController = TextEditingController();
    return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(


                controller: myController,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  phoneNumber = myController.text ;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Phone Number',
                  suffixIcon: IconButton(icon: Icon(Icons.call,size: 30,),onPressed: (){


                    //SystemChannels.textInput.invokeMethod('text-input.hide');
                    // delete content when hidding keyboard
                    FocusScope.of(context).unfocus();
                  },),
                ),
              ),
            )





    );
  }
}*/




class PhoneNumber extends StatefulWidget {

  Function update;

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController t1 = TextEditingController();
  CallLogs cl = new CallLogs();
  bool empty = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.update = (text){
      print('called: ' + text);

      setState(() {
        t1.text = text;
      });
    };

    t1.addListener(() {
      setState(() {

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          controller: t1,
          decoration: InputDecoration(
              labelText: "Phone number",
              contentPadding: EdgeInsets.all(10),
              suffixIcon: t1.text.length > 0 ? IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: (){
                    cl.call(t1.text);
                  }) : null),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          onSubmitted: (value) => {cl.call(t1.text)},)
    );
  }
}


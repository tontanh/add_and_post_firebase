import 'package:flutter/material.dart';

class savedata extends StatefulWidget {
  @override
  _savedataState createState() => _savedataState();
}

String text;
Widget button() {
  return RaisedButton(
    onPressed: () {},
    child: Text("ok"),
  );
}

Widget titletext() {
  SizedBox(
    height: 20,
  );
  return Container(
    margin: EdgeInsets.only(
      top: 10,
      left: 30,
      right: 30,
    ),
    // color: Colors.black,
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      onChanged: (value) => (value = text),
    ),
  );
}

class _savedataState extends State<savedata> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[500],
      child: Column(
        children: [
          titletext(),
          titletext(),
          titletext(),
          button(),
        ],
      ),
    );
  }
}

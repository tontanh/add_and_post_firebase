import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class savedata extends StatefulWidget {
  @override
  _savedataState createState() => _savedataState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String text1;
String text2;
String text3;
//String imageUrl;
_boximage() {
  return Container(
    margin: EdgeInsets.all(10),
    // height: 200,
    child: Placeholder(fallbackHeight: 200.0, fallbackWidth: double.infinity),
  );
}

Widget addpicture() {
  return Container(
    child: Column(
      children: <Widget>[
        _boximage(),
        RaisedButton(
          child: Text('Upload Image'),
          color: Colors.white,
          onPressed: () => print('t'),
        )
      ],
    ),
  );
}

Widget button() {
  return RaisedButton(
    onPressed: () {
      print(
        'name = $text1 surname = $text2 detail = $text3',
      );
    },
    child: Text("ok"),
  );
}

Widget titletext(
    {String hinttext, ValueChanged valueChange, final double top}) {
  return Container(
    margin: EdgeInsets.only(
      top: top,
      left: 30,
      right: 30,
    ),
    //  color: Colors.black,
    child: TextField(
        decoration: InputDecoration(
          hintText: hinttext,
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        onChanged: valueChange),
  );
}

class _savedataState extends State<savedata> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue[500],
      child: Column(
        children: [
          addpicture(),
          titletext(
              hinttext: 'Name',
              valueChange: (value) {
                text1 = value.trim();
              },
              top: 50),
          titletext(
              hinttext: 'Surname',
              valueChange: (value) {
                text2 = value.trim();
              },
              top: 10),
          titletext(
              hinttext: 'detail',
              valueChange: (value) {
                text3 = value.trim();
              },
              top: 10),
          button(),
        ],
      ),
    );
  }
}

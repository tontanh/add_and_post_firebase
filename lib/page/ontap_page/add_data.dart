import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Savedata extends StatefulWidget {
  @override
  _SavedataState createState() => _SavedataState();
}

class _SavedataState extends State<Savedata> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  String text1;
  String text2;
  String text3;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            //color: Colors.blue[500],
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textshow(),
                    _boximage(),
                    titletext(
                        hinttext: 'ຊື່ສະຖານທີ',
                        valueChange: (value) {
                          text1 = value.trim();
                        },
                        top: 10,
                        width: 300),
                    titletext(
                        hinttext: 'ລາຍລະອຽດ',
                        valueChange: (value) {
                          text2 = value.trim();
                        },
                        top: 10,
                        width: 300),
                    titletext(
                      hinttext: 'ເວລາ',
                      valueChange: (value) {
                        text3 = value.trim();
                      },
                      top: 10,
                      width: 100,
                    ),
                  ],
                ),
                button(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _textshow() {
    return Center(
        child: Container(
      margin: EdgeInsets.only(top: 50, bottom: 20),
      child: Text(
        'ຊອກໝູ່ໄປທ່ຽວນຳ',
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }

//String imageUrl;
  _boximage() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            _image == null
                ? Image.asset(
                    'images/tonpicture.jpg',
                    height: 150,
                    width: 300,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    _image,
                    height: 150,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(90))),
                child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      getImage();
                    }),
              ),
            ),
          ],
        ),
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
      {String hinttext, ValueChanged valueChange, double top, double width}) {
    return Container(
      height: 35,
      width: width,
      margin: EdgeInsets.only(
        top: top,
        left: 30,
        right: 30,
      ),
      //  color: Colors.black,
      child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            hintText: hinttext,
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
          ),
          onChanged: valueChange),
    );
  }
}

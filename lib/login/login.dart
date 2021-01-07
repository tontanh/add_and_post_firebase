import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 200),
          child: Column(
            children: [
              _buttontext('Gmail'),
              _buttontext('Password'),
            ],
          ),
        ),
      ),
    );
  }

  _buttontext(
    String text,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 260, bottom: 10),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  const Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

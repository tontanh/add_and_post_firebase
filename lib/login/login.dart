import 'package:add_and_post_firebase/login/register.dart';
import 'package:add_and_post_firebase/page/homepage.dart';
import 'package:add_and_post_firebase/page/main_page.dart';
import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  @override
  String textgmail;
  String textpwd;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              // margin: EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  _textlogo(),
                  SizedBox(
                    height: 0,
                  ),
                  _buttontext(
                      txtinflied: 'ອີເມວ',
                      valueChanged: (value) {
                        textgmail = value.trim();
                      },
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: 5,
                  ),
                  _buttontext(
                    txtinflied: 'ລະຫັດ',
                    valueChanged: (value) {
                      textpwd = value.trim();
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buttonlogin(context),
                  _textregister(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttontext(
      {String txtinflied,
      ValueChanged valueChanged,
      bool obscureText,
      TextInputType keyboardType}) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10, bottom: 10),
          ),
          TextFormField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: txtinflied,
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
            onChanged: valueChanged,
          ),
          // SizedBox(
          //   height: 50,
          // )
        ],
      ),
    );
  }

  _textlogo() {
    return Container(
      margin: EdgeInsets.only(top: 130, bottom: 40),
      child: Text(
        'Private App',
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 40),
      ),
    );
  }

  _buttonlogin(BuildContext buildContext) {
    return Container(
      height: 40,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: FlatButton(
        onPressed: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (buildContext) => Main_page());
          Navigator.of(buildContext).pushAndRemoveUntil(
              materialPageRoute, (Route<dynamic> route) => false);
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  _textregister(BuildContext buildContext) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(right: 35),
      child: InkWell(
        child: Text(
          'ລົງທະບຽນ',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
        onTap: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (buildContext) => registerpage());
          Navigator.of(buildContext).pushAndRemoveUntil(
              materialPageRoute, (Route<dynamic> route) => false);
        },
      ),
    );
  }
}

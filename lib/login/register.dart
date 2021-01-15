import 'package:add_and_post_firebase/login/login.dart';
import 'package:flutter/material.dart';

class registerpage extends StatefulWidget {
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('ລົງທະບຽນ'),
        //   backgroundColor: Colors.blue,
        // ),
        body: Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                _covertext(),
                SizedBox(height: 10),
                _textinput(),
              ],
            ),
          ),
          _buttonback(),
        ],
      ),
    ));
  }

  _buttonback() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        height: 30,
        width: 95,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: FlatButton(
          child: Text(
            'ມີບັນຊິແລ້ວ',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => loginpage());
            Navigator.of(context).pushAndRemoveUntil(
                materialPageRoute, (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }

  _covertext() {
    return SafeArea(
      child: Text(
        'ລົງທະບຽນ',
        style: TextStyle(color: Colors.blue, fontSize: 30),
      ),
    );
  }

  _textinput() {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              hintText: 'name',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

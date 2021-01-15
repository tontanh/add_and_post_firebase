import 'package:flutter/material.dart';

class registerpage extends StatefulWidget {
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ລົງທະບຽນ'),
        backgroundColor: Colors.blue[100],
      ),
      body: Container(
        child: Column(
          children: [
            _textbox(),
          ],
        ),
      ),
    );
  }

  _textbox() {
    return Container(
      child: TextFormField(),
    );
  }
}

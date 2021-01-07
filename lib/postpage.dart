import 'package:flutter/material.dart';

class postpage extends StatefulWidget {
  @override
  _postpageState createState() => _postpageState();
}

class _postpageState extends State<postpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          _container1(),
          _container2(),
        ],
      ),
    );
  }

  _container1() {
    return Expanded(
      child: Container(
        color: Colors.orange,
        child: Image.network(
          'https://i.pinimg.com/originals/46/da/e5/46dae512e375bee2664a025507da8795.jpg',
          width: 400,
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _container2() {
    return Expanded(
      child: Container(
        color: Colors.black,
      ),
    );
  }
}

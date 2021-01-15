import 'package:flutter/material.dart';

class Postpage extends StatefulWidget {
  @override
  _PostpageState createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          _container1(),
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
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

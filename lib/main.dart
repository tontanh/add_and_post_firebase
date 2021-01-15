import 'package:add_and_post_firebase/login/login.dart';
import 'package:flutter/material.dart';

import 'page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'private app',
      home: loginpage(),
      theme: ThemeData(fontFamily: 'NotoSansLao'),
    );
  }
}

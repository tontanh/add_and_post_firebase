import 'package:add_and_post_firebase/page/homepage.dart';
import 'package:add_and_post_firebase/page/ontap_page/post_public.dart';
import 'package:flutter/material.dart';

import 'ontap_page/add_data.dart';
import 'ontap_page/profile.dart';

class Main_page extends StatefulWidget {
  @override
  _Main_pageState createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = Home();
        break;
      case 1:
        child = Savedata();
        break;
      case 2:
        child = Profile_page();
        break;
    }
    return Scaffold(
      //appBar: AppBar(),
      body: SizedBox.expand(
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'ໜ້າຫຼັກ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_outlined), label: 'ເພີ່ມ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'ໂປຣໄຟຣ໌'),
        ],
      ),
    );
  }
}

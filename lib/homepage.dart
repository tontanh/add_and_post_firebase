import 'package:add_and_post_firebase/postpage.dart';
import 'package:add_and_post_firebase/savedata.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

DateTime currentDate = DateTime.now();

class _HomeState extends State<Home> {
  TabController controller;
  List<Widget> pages = [
    postpage(),
    savedata(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 50,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 30),
                tabs: [
                  Tab(
                    text: 'Post',
                  ),
                  Tab(
                    text: 'save',
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: controller,
                children: [
                  postpage(),
                  savedata(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
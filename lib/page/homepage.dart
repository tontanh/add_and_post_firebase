import 'package:add_and_post_firebase/page/ontap_page/post_friend.dart';
import 'package:add_and_post_firebase/page/ontap_page/post_public.dart';
import 'package:add_and_post_firebase/page/ontap_page/add_data.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

DateTime currentDate = DateTime.now();

class _HomeState extends State<Home> {
  TabController controller;
  List<Widget> pages = [
    Postpage(),
    Post_friend(),
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
              expandedHeight: 00,
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
              // actions: [
              //   Container(
              //     margin: EdgeInsets.only(right: 20),
              //     child: IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.logout,
              //         size: 50,
              //       ),
              //     ),
              //   )
              // ],
              bottom: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 20),
                tabs: [
                  Tab(
                    text: 'ສາຖາລະນະ',
                  ),
                  Tab(
                    text: 'ເພື່ອນ',
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: controller,
                children: [
                  Postpage(),
                  Post_friend(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

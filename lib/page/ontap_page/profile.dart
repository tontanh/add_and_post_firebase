import 'package:add_and_post_firebase/page/Widgets/menupopup_logout.dart';
import 'package:flutter/material.dart';

class Profile_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ໂປຣໄຟຣ໌'),
        actions: [
          PopupMenuButton(
              onSelected: choiceAtion,
              itemBuilder: (BuildContext context) {
                return Constants_logout.choices.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
        ],
      ),
    );
  }

  void choiceAtion(String choice) {
    if (choice == Constants_logout.editprofile) {
      print('editeprofile');
    }
    if (choice == Constants_logout.signout) {
      print('editeprofile');
    }
  }
}

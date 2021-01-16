import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAlertdialog {
  ShowAlertdialog();
  showalert(
      {BuildContext context, IconData iconData, String title, String ms}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                children: [Icon(iconData), Text(title)],
              ),
              content: Text(ms),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ຕົກລົງ'))
              ],
            ));
  }
}

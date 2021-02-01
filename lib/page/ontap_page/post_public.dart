import 'dart:ffi';

import 'package:add_and_post_firebase/models/modelspublic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Postpage extends StatefulWidget {
  @override
  _PostpageState createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  List<Publicmodels> publicModels = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readalldata();
  }

  Widget showplacename(int index) {
    String stringplacename = publicModels[index].placename;
    return Container(
      color: Colors.blue,
      child: Text(
        'ສະຖາທີ : $stringplacename',
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget showdetail(int index) {
    String stringdetail = publicModels[index].detail;
    String stringtime = publicModels[index].time;
    if (stringdetail.length > 100) {
      stringdetail = stringdetail.substring(0, 99);
      stringdetail = '$stringdetail ... ';
    }
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text('$stringdetail ເວລາ : $stringtime'),
    );
  }

  // Widget showtime(int index) {
  //   return Container(
  //     color: Colors.blue,
  //     child: Text(publicModels[index].time),
  //   );
  // }

  Widget showimage(int index) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Image.network(
        publicModels[index].pathimage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget showlisview(int index) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showplacename(index),
          showdetail(index),
          showimage(index),
        ],
      ),
    );
  }
// .collection("Publicdata")
// .orderBy("timenow", "desc")

//  Firestore firestore = Firestore.instance;
//     CollectionReference collectionReference =
//         firestore.collection('Publicdata');
//     //  .orderBy("timenow".toString(), descending: true);
//     //.orderBy("timenow");
//     await collectionReference.snapshots().listen(
//       (response) {
//         List<DocumentSnapshot> snapshots = response.documents;
//         for (var snapshots in snapshots) {
//           Publicmodels publicmodels = Publicmodels.fromMap(snapshots.data);
//           setState(() {
//             publicModels.add(publicmodels);
//           });
//         }

  Future<void> readalldatalast() async {}

  Future<void> readalldata() async {
    Firestore.instance
        .collection('Publicdata')
        .firestore
        .collection('Publicdata')
        .orderBy("timenow", descending: true)
        .snapshots()
        .listen(
      (response) {
        List<DocumentSnapshot> snapshots = response.documents;
        for (var snapshots in snapshots) {
          Publicmodels publicmodels = Publicmodels.fromMap(snapshots.data);
          setState(() {
            publicModels.add(publicmodels);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: publicModels.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return showlisview(index);
          // Text(publicModels[index].placename);
        },
      ),
    );
  }
}

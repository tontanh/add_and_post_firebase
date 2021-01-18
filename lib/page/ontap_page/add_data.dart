import 'dart:io';
import 'dart:math';

import 'package:add_and_post_firebase/page/Widgets/showdialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Savedata extends StatefulWidget {
  @override
  _SavedataState createState() => _SavedataState();
}

class _SavedataState extends State<Savedata> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  String textnameplace;
  String textdetail;
  String texttime;
  String urlPicture;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            //color: Colors.blue[500],
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textshow(),
                    _boximage(),
                    titletext(
                        hinttext: 'ຊື່ສະຖານທີ',
                        valueChange: (value) {
                          textnameplace = value.trim();
                        },
                        top: 10,
                        width: 300),
                    titletext(
                        hinttext: 'ລາຍລະອຽດ',
                        valueChange: (value) {
                          textdetail = value.trim();
                        },
                        top: 10,
                        width: 300),
                    titletext(
                      hinttext: 'ເວລາ',
                      valueChange: (value) {
                        texttime = value.trim();
                      },
                      top: 10,
                      width: 100,
                    ),
                  ],
                ),
                button(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> uploadimages() async {
    Random random = Random();
    int i = random.nextInt(10000000);
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('images_public/images_post/privite$i.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);
    urlPicture =
        await (await storageUploadTask.onComplete).ref.getDownloadURL();
    print('urlpicture = $urlPicture');
    // lastidmothed();
    insertdatatofirebase();
  }

  // Future<void> lastidmothed() async {
  //   Firestore rootRef = Firestore.instance;

  //   await rootRef
  //       .collection('Publicdata')
  //       .orderBy('id', descending: true)
  //       .limit(1);
  //   print('lastid = $rootRef');
  // }

  Future<void> insertdatatofirebase() async {
    // int counterdocment = 2;
    // counterdocment++;
    Firestore firestore = Firestore.instance;
    Map<String, dynamic> map = Map();
    map['placename'] = textnameplace;
    map['detail'] = textdetail;
    map['time'] = texttime;
    map['pathimage'] = urlPicture;
    //map['id'] = counterdocment++;
    await firestore
        .collection('Publicdata')
        .document()
        .setData(map)
        .then((value) {
      print('success');
    });
  }

  _textshow() {
    return Center(
        child: Container(
      margin: EdgeInsets.only(top: 50, bottom: 20),
      child: Text(
        'ຊອກໝູ່ໄປທ່ຽວນຳ',
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }

//String imageUrl;
  _boximage() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            _image == null
                ? Image.asset(
                    'images/tonpicture.jpg',
                    height: 150,
                    width: 300,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    _image,
                    height: 150,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(90))),
                child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      getImage();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button() {
    return Container(
      color: Colors.blue,
      child: FlatButton(
        onPressed: () {
          if (_image == null) {
            ShowAlertdialog().showalert(
                context: context,
                iconData: Icons.error,
                title: 'ຜິດພາດ',
                ms: 'ກາລຸນາເພີ່ມຮູບພາບ');
          } else if (textdetail == null ||
              textnameplace == null ||
              texttime == null) {
            ShowAlertdialog().showalert(
                context: context,
                iconData: Icons.error,
                title: 'ຜິດພາດ',
                ms: 'ກາລຸນາເພີ່ມຂໍ້ມູນ');
          } else {
            uploadimages();
          }
        },
        child: Text("ok"),
      ),
    );
  }
}

Widget titletext(
    {String hinttext, ValueChanged valueChange, double top, double width}) {
  return Container(
    height: 35,
    width: width,
    margin: EdgeInsets.only(
      top: top,
      left: 30,
      right: 30,
    ),
    //  color: Colors.black,
    child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          hintText: hinttext,
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        onChanged: valueChange),
  );
}

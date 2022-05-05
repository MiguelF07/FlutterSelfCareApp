// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';
import 'package:homework/AllEntries.dart';
import 'package:homework/database_helper.dart';
import 'package:image_picker/image_picker.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key, required this.dbHelper}) : super(key: key);

  final DatabaseHelper dbHelper;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SecondTab> {
  final _formKey = GlobalKey<FormState>();
  String imageFile = "";
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  List entries = [];
  int hasImage = 0;

  void addData(Map<String, dynamic> card) {
    setState(() {
      entries.add(card);
    });
  }

  void createObject(
      String title, String date, String description, File image, bool hasImg) {
    Map<String, dynamic> map = {};
    map['title'] = title;
    map['date'] = date;
    map['description'] = description;
    map['image'] = image;
    map['hasImg'] = hasImg;

    addData(map);
  }

  void _insert(String title, String date, String description, String image,
      int hasImg) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnDate: date,
      DatabaseHelper.columnDescr: description,
      DatabaseHelper.columnImage: image,
      DatabaseHelper.columnHasImage: hasImg,
    };
    final id = await widget.dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await widget.dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
  }

  refresh() {
    setState(() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AllEntries(
                hasImage: hasImage,
                entries: entries,
                dbHelper: widget.dbHelper,
                notifyParent: refresh)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Text("Journal",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Write on your Journal:",
                style: TextStyle(fontSize: 18),
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Title',
                ),
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  labelText: 'Date',
                ),
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.book),
                  labelText: 'Journal Entry',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              )),
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Upload a Picture:",
                style: TextStyle(fontSize: 16),
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _getFromGallery();
                        setState(() {
                          hasImage = 1;
                        });
                      },
                      child: Text("FROM GALLERY"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _getFromCamera();
                        setState(() {
                          hasImage = 1;
                        });
                      },
                      child: Text("FROM CAMERA"),
                    )
                  ])),
          Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: ElevatedButton(
                onPressed: (() => {
                      // createObject(titleController.text, dateController.text,
                      //     descriptionController.text, imageFile, hasImage),
                      debugPrint("DEBUG" + entries.toString()),
                      _insert(titleController.text, dateController.text,
                          descriptionController.text, imageFile, hasImage),
                      setState(() {
                        titleController.clear();
                        dateController.clear();
                        descriptionController.clear();
                        hasImage = 0;
                      }),

                      _dialog()
                    }),
                child: const Text("Post to Journal"),
              )),

          Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: OutlinedButton(
                  onPressed: () {
                    debugPrint('Received click');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllEntries(
                              hasImage: hasImage,
                              entries: entries,
                              dbHelper: widget.dbHelper,
                              notifyParent: refresh)),
                    );
                  },
                  child: const Text('See Journal Entries!')))

          // Add TextFormFields and ElevatedButton here.
        ],
      ),
    ));

    /// Get from gallery
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile.path;
      });
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile.path;
      });
    }
  }

  Future<void> _dialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Done!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Your entry was posted on your journal'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

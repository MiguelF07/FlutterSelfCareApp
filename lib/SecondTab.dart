// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';
import 'package:homework/AllEntries.dart';
import 'package:image_picker/image_picker.dart';

class SecondTab extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SecondTab> {
  final _formKey = GlobalKey<FormState>();
  late File imageFile;
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  List entries = [];

  void addData(Map<String, dynamic> card) {
    setState(() {
      entries.add(card);
    });
  }

  void createObject(String title, String date, String description, File image) {
    Map<String, dynamic> map = {};
    map['title'] = title;
    map['date'] = date;
    map['description'] = description;
    map['image'] = image;

    addData(map);
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
                      },
                      child: Text("PICK FROM GALLERY"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: Text("PICK FROM CAMERA"),
                    )
                  ])),
          Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: ElevatedButton(
                onPressed: (() => {
                      createObject(titleController.text, dateController.text,
                          descriptionController.text, imageFile),
                      debugPrint("DEBUG" + entries.toString())
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
                          builder: (context) => AllEntries(entries: entries)),
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
        imageFile = File(pickedFile.path);
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
        imageFile = File(pickedFile.path);
      });
    }
  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//             child:
//                 //Por PADDING
//                 Column(children: <Widget>[
//           search(),
//           _space(50.0),
//           prettyContainer(
//               'Day 16/03/2022', 'What a great day. Met someone really cool.'),
//           _space(40.0),
//           prettyContainer('Day 14/03/2022', 'Feeling kinda tired :/'),
//           _space(40.0),
//           prettyContainer('Day 10/03/2022', 'Starting a new journey'),
//           _space(50.0),
//           OutlinedButton(
//               onPressed: () {
//                 debugPrint('Received click');
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AllEntries()),
//                 );
//               },
//               child: const Text('Click Me')),
//         ])));
//   }

//   @override
//   Widget search() => Column(children: [
//         Container(
//             child: Container(
//                 width: double.infinity,
//                 height: 150.0,
//                 child: Center(
//                   child: Text(
//                     "My Journal",
//                     style: TextStyle(
//                         fontSize: 22.0,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ))),
//         Container(
//             width: 550.0,
//             child: TextField(
//                 decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               hintText: 'What are you thinking about today?',
//             ))),
//       ]);
// }

// Widget _space(double x) {
//   return SizedBox(height: x);
// }

// Widget _text() {
//   return Text("lksdajf");
// }

// Widget prettyContainer(String tit, String sub) {
//   return FancyContainer(
//     onTap: () {},
//     color1: Color.fromARGB(255, 255, 255, 255),
//     color2: Color.fromARGB(255, 255, 255, 255),
//     title: tit,
//     textcolor: Colors.black,
//     subtitle: sub,
//     subtitlecolor: Colors.black,
//     width: 600,
//   );
}

import 'dart:io';

import 'package:flutter/material.dart';

class AllEntries extends StatefulWidget {
  const AllEntries({Key? key, required this.entries}) : super(key: key);
  final List entries;
  @override
  State<AllEntries> createState() => _AllEntriesState();
}

class _AllEntriesState extends State<AllEntries> {
  List data = [];
  bool hasWidget = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Journal Entries"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          (widget.entries.isNotEmpty)
              ? Column(
                  children: getEntries(data),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                      child: Text(
                    "No Entries to Show",
                    style: TextStyle(fontSize: 16),
                  )))
        ])));
  }

  List<Widget> getEntries(List maps) {
    List<Widget> list = [];
    debugPrint("length" + widget.entries.length.toString());
    for (var i = widget.entries.length - 1; i >= 0; i--) {
      var wid = entry(widget.entries[i]['title'], widget.entries[i]['date'],
          widget.entries[i]['description'], widget.entries[i]['image']);
      list.add(Row(children: [wid]));
    }
    // return new Padding(
    //   padding: EdgeInsets.all(15.0),
    //   child: entry(),
    // );
    return list;
  }

  Widget entry(String title, String date, String description, File image) {
    return (Expanded(
        child: Card(
            elevation: 4,
            child: Container(
                child: Row(children: [
              Expanded(
                  flex: 5,
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: 15, left: 15, right: 15, bottom: 10),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: Text(
                              date,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10),
                                child: Text(
                                  description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ))),
                      ],
                    )
                  ])),
              Expanded(
                flex: 5,
                child: Column(children: [
                  GestureDetector(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (context) => ImageDialog(image: image));
                        // builder: (_) => ImageDialog(image: image));
                      }, // Image tapped
                      child: Image.file(
                        image,
                        fit: BoxFit.cover, // Fixes border issues
                        width: 110.0,
                        height: 110.0,
                      )),
                ]),
                //   Image.file(image,
                //       width: 100, height: 100, alignment: Alignment.topCenter)
                // ]),
              )
            ])))));
  }
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key, required this.image}) : super(key: key);
  final File image;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 300,
      height: 300,
      child: Column(children: [
        Image.file(
          image,
          fit: BoxFit.cover, // Fixes border issues
          width: 300,
          height: 300,
        )
      ]),
    ));
  }
}

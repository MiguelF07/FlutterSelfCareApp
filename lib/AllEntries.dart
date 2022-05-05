import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homework/database_helper.dart';

class AllEntries extends StatefulWidget {
  const AllEntries(
      {Key? key,
      required this.entries,
      required this.hasImage,
      required this.dbHelper,
      required this.notifyParent})
      : super(key: key);
  final List entries;
  final int hasImage;
  final DatabaseHelper dbHelper;
  final Function() notifyParent;
  @override
  State<AllEntries> createState() => _AllEntriesState();
}

class _AllEntriesState extends State<AllEntries> {
  List data = [];
  bool hasWidget = false;
  late Future<List<Map<String, dynamic>>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = _query();
  }

  Future<List<Map<String, dynamic>>> _query() async {
    final allRows = await widget.dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
    return allRows;
  }

  void _delete(int id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await widget.dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }

  void updatePage() {
    widget.notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Journal Entries"),
              ),
              body: SingleChildScrollView(
                  child: Column(children: [
                (snapshot.data!.isNotEmpty)
                    ? Column(
                        children: getEntries(snapshot),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                            child: Text(
                          "No Entries to Show",
                          style: TextStyle(fontSize: 16),
                        )))
              ])));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  List<Widget> getEntries(AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
    List<Widget> list = [];

    debugPrint("length" + snapshot.data!.length.toString());
    for (var i = snapshot.data!.length - 1; i >= 0; i--) {
      var wid = entry(
          snapshot.data![i]['_id'],
          snapshot.data![i]['title'],
          snapshot.data![i]['date'],
          snapshot.data![i]['description'],
          snapshot.data![i]['image'],
          snapshot.data![i]['hasImage']);
      list.add(Row(children: [wid]));
    }
    // return new Padding(
    //   padding: EdgeInsets.all(15.0),
    //   child: entry(),
    // );
    return list;
  }

  Widget entry(int id, String title, String date, String description,
      String image, int hasImg) {
    File img = File(image);

    int entryID = id;

    return (Expanded(
        child: Card(
            elevation: 4,
            child: Container(
                child: Column(children: [
              Row(children: [
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
                      ),
                    ])),
                (hasImg == 1)
                    ? Expanded(
                        flex: 5,
                        child: Column(children: [
                          GestureDetector(
                              onTap: () async {
                                await showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ImageDialog(image: img));
                                // builder: (_) => ImageDialog(image: image));
                              }, // Image tapped
                              child: Image.file(
                                img,
                                fit: BoxFit.cover, // Fixes border issues
                                width: 110.0,
                                height: 110.0,
                              )),
                        ]),
                        //   Image.file(image,
                        //       width: 100, height: 100, alignment: Alignment.topCenter)
                        // ]),
                      )
                    : SizedBox(),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        child: Text(
                          'Delete',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () => {_delete(id), updatePage()},
                      )),
                ],
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

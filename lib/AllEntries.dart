import 'package:flutter/material.dart';

class AllEntries extends StatefulWidget {
  @override
  State<AllEntries> createState() => _AllEntriesState();
}

class _AllEntriesState extends State<AllEntries> {
  List data = [];
  bool hasWidget = false;

  void addData(Map<String, dynamic> card) {
    setState(() {
      data.add(card);
    });
  }

  void createObject(
      String title, String date, String description, String image) {
    Map<String, dynamic> map = {};
    map['title'] = title;
    map['date'] = date;
    map['description'] = description;
    map['image'] = image;

    addData(map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Journal Entries"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          ElevatedButton(
            onPressed: () => setState(() {
              createObject("Titulo", "Data", "Descricao", "Imagem");
              debugPrint(data.toString());
              hasWidget = true;
            }),
            child: Text("Button"),
          ),
          (hasWidget)
              ? Column(
                  children: getEntries(data),
                )
              : Text("")
        ])));
  }

  List<Widget> getEntries(List maps) {
    List<Widget> list = [];
    debugPrint("length" + data.length.toString());
    for (var i = 0; i < data.length; i++) {
      var wid = entry();
      list.add(Row(children: [wid]));
    }
    // return new Padding(
    //   padding: EdgeInsets.all(15.0),
    //   child: entry(),
    // );
    return list;
  }

  Widget entry() {
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
                              "Title",
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
                              "Date",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                      ],
                    )
                  ])),
              Expanded(
                flex: 5,
                child: Column(children: [Text("Image")]),
              )
            ])))));
  }
}

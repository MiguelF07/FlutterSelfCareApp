import 'package:flutter/material.dart';
import 'package:homework/Profile.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  void mockFunction() {
    1 + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Welcome Miguel",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.teal,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        icon: const Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.white,
                        )),
                  ))
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [Text("Hey")],
          )
        ],
      ),
    );
  }
}

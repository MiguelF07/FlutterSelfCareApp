import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void main() => runApp(const ThirdTab());

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  final CountDownController _controller = CountDownController();
  int duration = 10 * 60;
  int total_time = 0;

  void changeDuration(String str) {
    setState(() {
      debugPrint(str + "hello");
      duration = int.parse(str) * 60;
      debugPrint("Set duration to $duration");
    });
  }

  void changeTotalTime() {
    setState(() {
      total_time = total_time + duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("middle of the code: $duration");
    return SingleChildScrollView(
        child: Card(
            child: Column(children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 0),
          child: Text("Focus",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      Container(
          child: CircularCountDownTimer(
        // Countdown duration in Seconds.
        duration: duration,

        // Countdown initial elapsed Duration in Seconds.
        initialDuration: 0,

        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        controller: _controller,

        // Width of the Countdown Widget.
        width: MediaQuery.of(context).size.width / 2,

        // Height of the Countdown Widget.
        height: MediaQuery.of(context).size.height / 2,

        // Ring Color for Countdown Widget.
        ringColor: Colors.grey[300]!,

        // Ring Gradient for Countdown Widget.
        ringGradient: null,

        // Filling Color for Countdown Widget.
        fillColor: Color.fromARGB(255, 119, 188, 172)!,

        // Filling Gradient for Countdown Widget.
        fillGradient: null,

        // Background Color for Countdown Widget.
        backgroundColor: Colors.teal[500],

        // Background Gradient for Countdown Widget.
        backgroundGradient: null,

        // Border Thickness of the Countdown Ring.
        strokeWidth: 20.0,

        // Begin and end contours with a flat edge and no extension.
        strokeCap: StrokeCap.round,

        // Text Style for Countdown Text.
        textStyle: const TextStyle(
          fontSize: 33.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

        // Format for the Countdown Text.
        textFormat: CountdownTextFormat.S,

        // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
        isReverse: true,

        // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
        isReverseAnimation: false,

        // Handles visibility of the Countdown Text.
        isTimerTextShown: true,

        // Handles the timer start.
        autoStart: false,

        // This Callback will execute when the Countdown Starts.
        onStart: () {
          // Here, do whatever you want
          debugPrint('Countdown Started');
        },

        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          // Here, do whatever you want
          debugPrint('Countdown Ended');
          changeTotalTime();
          _dialog();
        },
      )),
      Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Text(
                    "How much time do you want to focus? (mins)",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  )),
              Flexible(
                  flex: 1,
                  child: TextField(
                    inputFormatters: [],
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      icon: Icon(Icons.timer),
                      hintText: "Minutes",
                    ),
                    onChanged: (String str) {
                      changeDuration(str);
                    },
                  ))
            ],
          )),
      Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // floatingActionButton: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              const SizedBox(
                width: 30,
              ),
              _button(
                  title: "Start",
                  onPressed: () => _controller.restart(duration: duration)),
              const SizedBox(
                width: 10,
              ),
              _button(title: "Pause", onPressed: () => _controller.pause()),
              const SizedBox(
                width: 10,
              ),
              _button(title: "Resume", onPressed: () => _controller.resume()),
              const SizedBox(
                width: 20,
              ),
              // _button(
              //     title: "Restart",
              //     onPressed: () =>
              //         _controller.restart(duration: duration))
            ],
          )),
      Container(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Total Time Focused: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(total_time.toString() + " mins")
            ],
          ))
    ])));
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: ElevatedButton(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal[500]),
      ),
      onPressed: onPressed,
    ));
  }

  Future<void> _dialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Focus Complete!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Congratulations! You completed your focus.'),
                Text('Check your Total Time Focused :D'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
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

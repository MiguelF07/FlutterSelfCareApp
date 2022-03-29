// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void main() => runApp(const FirstScreen());

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Self Care',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 207, 23, 23),
      ),
      home: const MyHomePage(title: 'Self Care'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _duration = 60;
  final CountDownController _controller = CountDownController();

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _space(30),
              _textW(),
              _space(50),
              countdown(),
              _space(100),
              countdown_buttons()
            ],
          ),
        ));
  }

  @override
  Widget countdown() {
    return Center(
      child: CircularCountDownTimer(
        // Countdown duration in Seconds.
        duration: _duration,

        // Countdown initial elapsed Duration in Seconds.
        initialDuration: 0,

        // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
        controller: _controller,

        // Width of the Countdown Widget.
        width: MediaQuery.of(context).size.width / 2,

        // Height of the Countdown Widget.
        height: MediaQuery.of(context).size.height / 2,

        // Ring Color for Countdown Widget.
        //Cor do anel a volta
        ringColor: Color.fromARGB(255, 37, 58, 172),

        // Ring Gradient for Countdown Widget.
        ringGradient: null,

        // Filling Color for Countdown Widget.
        fillColor: Color.fromARGB(255, 93, 140, 201)!,

        // Filling Gradient for Countdown Widget.
        fillGradient: null,

        // Background Color for Countdown Widget.
        //Fundo do anel
        backgroundColor: Color.fromARGB(255, 66, 83, 182),

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
        isReverse: false,

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
        },
      ),
    );
  }

  Widget countdown_buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 30,
        ),
        _button(title: "Start", onPressed: () => _controller.start()),
        const SizedBox(
          width: 10,
        ),
        _button(title: "Pause", onPressed: () => _controller.pause()),
        const SizedBox(
          width: 10,
        ),
        _button(title: "Resume", onPressed: () => _controller.resume()),
        const SizedBox(
          width: 10,
        ),
        _button(
            title: "Restart",
            onPressed: () => _controller.restart(duration: _duration))
      ],
    );
  }

  //     Widget countdown_buttons() {
  //     floatingActionButton: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         const SizedBox(
  //           width: 30,
  //         ),
  //         _button(title: "Start", onPressed: () => _controller.start()),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         _button(title: "Pause", onPressed: () => _controller.pause()),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         _button(title: "Resume", onPressed: () => _controller.resume()),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         _button(
  //             title: "Restart",
  //             onPressed: () => _controller.restart(duration: _duration))
  //       ],
  //     ),
  //   );
  // }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: ElevatedButton(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 37, 58, 172)),
      ),
      onPressed: onPressed,
    ));
  }

  Widget _space(double x) {
    return SizedBox(height: x);
  }

  Widget _textW() {
    return Text(
      "How much time can you focus? ☺️",
      style: TextStyle(
          fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}

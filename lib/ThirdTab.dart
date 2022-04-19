import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ThirdTab extends StatefulWidget {
  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  CountDownController _controller = CountDownController();
  bool _isPause = false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("How much time do you want to focus?"),
        Center(
          child: CircularCountDownTimer(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            duration: 14,
            fillColor: Colors.amber,
            ringColor: Colors.white,
            controller: _controller,
            backgroundColor: Colors.white54,
            strokeWidth: 10.0,
            strokeCap: StrokeCap.round,
            isTimerTextShown: true,
            isReverse: true,
            onComplete: () {
              Alert(
                      context: context,
                      title: 'Done',
                      style: AlertStyle(
                        isCloseButton: true,
                        isButtonVisible: false,
                        titleStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      type: AlertType.success)
                  .show();
            },
            textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
          ),
        )
      ],
    );
    // floatingActionButton: FloatingActionButton.extended(
    //     onPressed: (){
    //       setState(() {
    //         if(_isPause){
    //           _isPause = false;
    //           _controller.resume();
    //         }else{
    //           _isPause = true;
    //           _controller.pause();
    //         }
    //       });
    //     },
    //     icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
    //     label: Text(_isPause ? 'Resume' : 'Pause'),
    // ),
    // );
  }
}

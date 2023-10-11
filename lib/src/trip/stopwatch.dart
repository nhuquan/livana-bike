import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  bool isTicking = false;
  int seconds = 0;
  int miliseconds = 0;
  int minutes = 0;
  int hours = 0;
  late Timer timer;
  final labs = [];

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1), _onTick);
    setState(() {
      isTicking = true;
    });
  }

  void _stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _createlab() {
    setState(() {
      labs.add('$hours hours $minutes minutes $seconds seconds');
    });
  }

  void _onTick(Timer time) {
    setState(() {
      ++miliseconds;

      if (miliseconds >= 1000) {
        seconds++;
        miliseconds = 0;
      }

      if (seconds >= 60) {
        minutes++;
        seconds = 0;
      }

      if (minutes >= 60) {
        hours++;
        minutes = 0;
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildListOfLap()),
          Expanded(child: _buildStopWatch(context)),
        ],
      ),
    );
  }

  Widget _buildListOfLap() {
    return ListView(
      children: labs.map((lap) => ListTile(title: Text(lap))).toList(),
    );
  }

  Widget _buildStopWatch(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$hours : ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '${minutes.toString().padLeft(2, '0')} : ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '${seconds.toString().padLeft(2, '0')} : ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              width: 70,
              child: Text(
                (miliseconds % 1000).toString().padLeft(3, '0'),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: isTicking ? _stopTimer : _startTimer,
              child: Text(isTicking ? 'Pause' : 'Start'),
            ),
            SizedBox(width: 20),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: _createlab,
              child: Text('End'),
            ),
          ],
        )
      ],
    );
  }
}

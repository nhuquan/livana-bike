import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  State createState() => StopWatchState();
}

class StopWatchState extends State<StopWatch> {
  late int seconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _onTick(Timer time) {
    setState(() {
      ++seconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stopwatch')),
      body: Text('0 second'),
    );
  }
}

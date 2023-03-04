// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;
  final Duration intervalDuration;

  const CountdownTimer(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.intervalDuration});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with SingleTickerProviderStateMixin {
  late Duration duration;
  late Timer timer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    duration = widget.endTime.difference(widget.startTime);
    _controller = AnimationController(vsync: this, duration: duration);
    _controller.forward();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_controller.isAnimating) {
            duration = duration - oneSec;
            if (duration.inSeconds <= 0) {
              timer.cancel();
              // Trigger alarm here
            }
          } else {
            timer.cancel();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
      style: const TextStyle(fontSize: 36.0),
    );
  }
}

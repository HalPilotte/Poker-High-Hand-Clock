// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class HighHandDisplay extends StatefulWidget {
  const HighHandDisplay({super.key});

  @override
  _HighHandDisplayState createState() => _HighHandDisplayState();
}

class _HighHandDisplayState extends State<HighHandDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 40,
        child: Row(
          children: [
            Container(),
            SizedBox(
              width: 2,
            ),
            Container(),
            SizedBox(
              width: 2,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

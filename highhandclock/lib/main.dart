import 'package:flutter/material.dart';

class HighHandController extends StatelessWidget {
  const HighHandController({required Key key, required this.title})
      : super(key: key);
  final Widget title;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    final cards = [
      'A',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      'J',
      'Q',
      'K'
    ];
    final boxDecoration =
        BoxDecoration(color: Colors.grey, border: Border.all(width: 1.5));

    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 4.0,
            ),
            Row(
              children: [
                for (var card in cards)
                  Expanded(
                    child: Container(
                      decoration: boxDecoration,
                      alignment: Alignment.center,
                      height: 61.5,
                      child: Text(
                        card.toString(),
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: boxDecoration,
                          alignment: Alignment.center,
                          height: 200.5,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 150, right: 150),
              child: SizedBox(
                height: 61.5,
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Enter a table number',
                        ),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 8.0,
                      child: ElevatedButton(
                          onPressed: onPressed, child: const Text('Enter')),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // fill table number slot on display page.
  void onPressed() {
    debugPrint('hello world');
  }
}

// This widget is the staging area for the high hand before it is submitted for display.
class HighHandConfirm extends StatefulWidget {
  const HighHandConfirm({super.key});

  @override
  State<HighHandConfirm> createState() => HighHandConfirmState();
}

class HighHandConfirmState extends State<HighHandConfirm> {
  //Add my state variables here

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const HighHandController(
          title: Text('High Hand Controller'),
          key: ValueKey('high_hand_controller'))));
}

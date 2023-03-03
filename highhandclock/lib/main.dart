import 'package:flutter/material.dart';
import 'staged_high_hand.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HighHandController(
          title: Text('High Hand Controller'),
          key: ValueKey('high_hand_controller'))));
}

class HighHandController extends StatefulWidget {
  const HighHandController({
    required Key key,
    required this.title,
  }) : super(key: key);

  final Widget title;

  @override
  State<HighHandController> createState() => _HighHandControllerState();
}

class _HighHandControllerState extends State<HighHandController> {
  List<String> cardSelectedList = [];

  String onCardSelected(String card) {
    debugPrint(card);
    return card;
  }

  @override
  Widget build(BuildContext context) {
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
      'T',
      'J',
      'Q',
      'K'
    ];
    final boxDecoration = BoxDecoration(
      color: Colors.grey[300],
      border: Border.all(width: 1.5),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: widget.title,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
// This is the admin drawer, where the admin can input the start and end times as well as the duration of each high hand period.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: boxDecoration,
              child: const Text(
                'Admin',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              child: ListTile(
                leading: Icon(Icons.timer_sharp),
                title: Text('Start Time'),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.timer_off),
              title: Text('End Time'),
            ),
            const ListTile(
              leading: Icon(Icons.timer),
              title: Text('Duration'),
            ),
            const ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Payout'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 4.0,
            ),

// This row contains the cards to be selected and placed into the staging area to be submitted as a high hand.
            Row(
              children: [
                for (var card in cards)
                  Expanded(
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            debugPrint(cardSelectedList.indexOf("").toString());
                            if (cardSelectedList.contains("")) {
                              cardSelectedList[cardSelectedList.indexOf("")] =
                                  onCardSelected(card);
                            } else {
                              cardSelectedList.add(
                                onCardSelected(card),
                              );
                            }
                          });
                        },
                        child: Text(
                          card.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

// This is the staging area for the current high hand.
            const Divider(
              color: Colors.black,
              thickness: 4,
            ),
            StagedHighHand(
              cardSelectedList: cardSelectedList,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: FocusScope(
                autofocus: true,
                child: SizedBox(
                  height: 61.5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: Column(
                            children: const [
                              Icon(
                                size: 40,
                                Icons.arrow_back,
                              ),
                              Text('Back'),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Table number',
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                          child: SizedBox(
                        width: 12.0,
                        height: 50,
                        child: Container(
                          color: Colors.red,
                          child: ElevatedButton(
                            onPressed: onPressed,
                            child: const Text('Enter'),
                          ),
                        ),
                      )),
                    ],
                  ),
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

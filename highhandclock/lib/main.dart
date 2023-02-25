import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HighHandController(
          title: Text('High Hand Controller'),
          key: ValueKey('high_hand_controller'))));
}

class HighHandController extends StatelessWidget {
  const HighHandController({
    required Key key,
    required this.title,
  }) : super(key: key);

  final Widget title;

  void onCardSelected(String card) {
    debugPrint(card);
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
      '10',
      'J',
      'Q',
      'K'
    ];
    final boxDecoration =
        BoxDecoration(color: Colors.grey[300], border: Border.all(width: 1.5));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: title,
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
                          onCardSelected(card);
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
            const StagedHighHand(),
            Container(
              margin: const EdgeInsets.only(left: 150, right: 150),
              child: FocusScope(
                autofocus: true,
                child: SizedBox(
                  height: 61.5,
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Table number',
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
class StagedHighHand extends StatefulWidget {
  const StagedHighHand({super.key});

  @override
  State<StagedHighHand> createState() => StagedHighHandState();
}

class StagedHighHandState extends State<StagedHighHand> {
  //Add my state variables here
  List<String> stagedCards = [];

  void addCard(String card) {
    setState(() {
      stagedCards.add(card);
    });
  }

  @override
  Widget build(BuildContext context) {
    final boxDecoration =
        BoxDecoration(color: Colors.grey[300], border: Border.all(width: 1.5));

    return Container(
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
                  child: OutlinedButton(
                    onPressed: () {},
                    child: stagedCards.length > i
                        ? Text(stagedCards[i])
                        : Container(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

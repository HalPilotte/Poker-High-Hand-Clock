import 'package:flutter/material.dart';
import 'staged_high_hand.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HighHandController(
              key: ValueKey('high_hand_controller'),
              title: Text('High Hand Controller'),
            ),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blueGrey,
        brightness: Brightness.light,
        useMaterial3: true,

        // create Color scheme for
        dividerTheme: DividerThemeData(
          color: Colors.blueGrey[400],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueGrey[700],
        ),
      ),
    ),
  );
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
    List<DropdownMenuItem<int>> hours = [];
    for (int i = 0; i < 24; i++) {
      int formattedHour = i % 12 == 0 ? 12 : i % 12;
      String hourText = i < 12 ? "$formattedHour am" : "$formattedHour pm";
      hours.add(DropdownMenuItem(
        value: i,
        child: Text(hourText),
      ));
    }

    List<DropdownMenuItem<int>> minutes = [];
    for (int i = 5; i <= 55; i += 5) {
      minutes.add(DropdownMenuItem(
        value: i,
        child: Text("$i"),
      ));
    }

    final boxDecoration = BoxDecoration(
      color: Colors.grey[300],
      border: Border.all(width: 1.5),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: widget.title,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
// This is the admin drawer, where the admin can input the start and end times as well as the duration of each high hand period.
      drawer: Drawer(
        width: 350,
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
            SizedBox(
              child: ListTile(
                leading: const Icon(Icons.timer_sharp),
                title: Row(
                  children: [
                    const Expanded(
                      child: Text('Start Time'),
                    ),
                    Expanded(
                      child: DropdownButton(
                        hint: const Text('Hour'),
                        items: hours,
                        onChanged: onChanged,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton(
                        hint: const Text('Minute'),
                        items: minutes,
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer_off),
              title: Row(
                children: [
                  const Expanded(
                    child: Text('End Time'),
                  ),
                  Expanded(
                    child: DropdownButton(
                      hint: const Text('Hour'),
                      items: hours,
                      onChanged: onChanged,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton(
                      hint: const Text('Minute'),
                      items: minutes,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: Row(
                children: [
                  const Expanded(
                    child: Text('Duration'),
                  ),
                  Expanded(
                    child: DropdownButton(
                      // alignment: Alignment.centerLeft,
                      hint: const Text('Hour'),
                      items: hours,
                      onChanged: onChanged,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton(
                      hint: const Text('Minute'),
                      items: minutes,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.attach_money),
              title: Row(
                children: [
                  const Text('Payout'),
                  const SizedBox(width: 10),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: (() {
                            setState(() {});
                          }),
                          child: const Text('Submit Configuration')))
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            const Divider(
              // color: Colors.blueGrey[600],
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
                          color: Colors.blueGrey,
                          width: 2,
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
                            // color: Colors.black,
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
              // color: Colors.black,
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
                        child: SizedBox(
                          width: 12.0,
                          height: 50,
                          child: Container(
                            decoration: const BoxDecoration(
                                // color: Colors.red,
                                ),
                            child: ElevatedButton(
                              onPressed: onPressed,
                              child: const Text('Clear'),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: const TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Table number',
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: SizedBox(
                          width: 12.0,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: onPressed,
                            child: const Text('Enter'),
                          ),
                        ),
                      ),
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

  void onChanged(value) {
    debugPrint('dropdownMenuItem');
  }
}

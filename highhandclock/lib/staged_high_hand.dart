import 'package:flutter/material.dart';

// This widget is the staging area for the high hand before it is submitted for display.
class StagedHighHand extends StatefulWidget {
  final List<String> cardSelectedList;
  const StagedHighHand({
    required this.cardSelectedList,
    super.key,
  });

  @override
  State<StagedHighHand> createState() => StagedHighHandState();
}

class StagedHighHandState extends State<StagedHighHand> {
  void addCard(String card) {
    setState(() {
      widget.cardSelectedList.add(card);
      debugPrint(widget.cardSelectedList.toString());
    });
  }

  void replaceCard(String card, int index) {
    setState(() {
      widget.cardSelectedList[index] = "";
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
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          replaceCard(widget.cardSelectedList[i], i);
                          debugPrint(widget.cardSelectedList.toString());
                        });
                      },
                      child: widget.cardSelectedList.length > i
                          ? Text(
                              widget.cardSelectedList[i],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 200.5 * 0.75,
                              ),
                            )
                          : Container(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Diceee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 3;
  int count = 0;
  void changeDice() {
    count++;
    leftDice = Random().nextInt(6) + 1;
    rightDice = Random().nextInt(6) + 1;
  }

  void reset() {
    count = 0;
  }

  bool check() {
    if (leftDice == rightDice) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (check())
          Text(
            'matched in $count turns',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      // changeDice();
                    });
                  },
                  child: Image.asset('images/dice$leftDice.png')),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      // changeDice();
                    });
                  },
                  child: Image.asset('images/dice$rightDice.png')),
            )),
          ],
        ),
        Container(
          height: 90,
          width: 100,
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (check()) {
                reset();
              }
              changeDice();
            });
          },
          child: Container(
            height: 45,
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  CupertinoIcons.circle,
                  color: Colors.white,
                ),
                Text(
                  'ROLL',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
          ),
        )
      ]),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-1.jpg';

  void rollDice() {
    var diceRoll = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = 'assets/images/dice-$diceRoll.jpg';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              textStyle: TextStyle(fontSize: 24),
              backgroundColor: Colors.black87),
          child: Text('Roll Dice'),
        )
      ],
    );
  }
}

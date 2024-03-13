import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRoller();
  }
}

class _DiceRoller extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    final random = Random();
    int min = 1;
    int max = 6;

    int randomInt = min + random.nextInt(max - min + 1);
    print('Random: $randomInt');

    if (randomInt == 1) {
      setState(() {
        activeDiceImage = 'assets/images/dice-1.png';
      });
    } else if (randomInt == 2) {
      setState(() {
        activeDiceImage = 'assets/images/dice-2.png';
      });
    } else if (randomInt == 3) {
      setState(() {
        activeDiceImage = 'assets/images/dice-3.png';
      });
    } else if (randomInt == 4) {
      setState(() {
        activeDiceImage = 'assets/images/dice-4.png';
      });
    } else if (randomInt == 5) {
      setState(() {
        activeDiceImage = 'assets/images/dice-5.png';
      });
    } else if (randomInt == 6) {
      setState(() {
        activeDiceImage = 'assets/images/dice-6.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      // color: Colors.black,
      Image.asset(activeDiceImage, width: 200),
      const Text('Dice',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      const SizedBox(
        height: 40,
      ),
      ElevatedButton(
        onPressed: rollDice,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 213, 169, 37),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        child: const Text('Roll Dice'),
      ),
    ]);
  }
}

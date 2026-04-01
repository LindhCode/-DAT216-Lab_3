import 'package:flutter/material.dart';
import 'package:lab2/util/difficulty.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {
  double _price = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _price,
          divisions: 15,
          max: 150,
          onChanged: (double value) {
            setState(() {
              _price = value;
            });
          },
        ),
        Text('${_price.round()} kr'),
      ],
    );
  }
}

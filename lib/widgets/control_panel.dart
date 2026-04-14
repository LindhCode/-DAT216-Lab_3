
import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingridient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  final double width;

  const ControlPanel({
    super.key,
    this.width = 320,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Logo(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hitta ett recept som passar genom att ändra inställningarna nedan",
              textAlign: TextAlign.left,
            ),
          ),
          Column(
            children: const [
              IngredientControl(),
              KitchenControl(),
            ],
          ),
          Column(
            children: const [
              SizedBox(child: Text("Svårighetsgrad")),
              DifficulyControl(),
            ],
          ),
          Column(
            children: const [
              SizedBox(height: 15),
              Text("Maxpris"),
              PriceControl(),
              SizedBox(height: 15),
              Text("Maxtid"),
              TimeControl(),
            ],
          ),
        ],
      ),
    );
  }
}
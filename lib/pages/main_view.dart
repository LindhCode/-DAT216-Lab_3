import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingridient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_controlPanel(context), _recipeArea(context)]),
    );
  }

  Widget _controlPanel(BuildContext context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('AlfAx Receptsök'),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hitta ett recept som passar genom att ändra inställningarna nedan",
              textAlign: TextAlign.left,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Text("Ingrediens", textAlign: TextAlign.left),
                  IngredientControl(),
                ],
              ),
              Row(
                children: [
                  Text("Kök", textAlign: TextAlign.left),
                  KitchenControl(),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
          Column(
            children: [
              SizedBox(child: Text("Svårighetsgrad")),
              DifficulyControl(),
            ],
          ),
          Column(
            children: [
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

  Widget _recipeArea(context) {
    return Expanded(
      child: Container(color: const Color.fromARGB(255, 204, 216, 176)),
    );
  }
}

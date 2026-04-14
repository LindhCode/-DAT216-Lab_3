import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingridient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_area.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_controlPanel(context),
      RecipeArea(),]
      ),
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
              IngredientControl(),
              KitchenControl(),
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
  
  //Widget RecipeArea(context) {
    //var showList = true;
    //var contents = showList ? RecipeList() : RecipeDetail();
    //return Expanded(child: contents);
    
  //}
}

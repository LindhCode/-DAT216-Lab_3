import 'package:flutter/material.dart';
import 'package:lab2/widgets/ingridient_control.dart';

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
        const Text(
          'AlfAx Receptsök',
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Hitta ett recept som passar genom att ändra inställningarna nedan",
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: [
            Text(
            "Ingrediens",
            textAlign: TextAlign.left,
            ),
            
            IngredientControl()
          ],)
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
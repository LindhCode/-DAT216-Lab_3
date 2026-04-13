import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});
  

@override
Widget build(BuildContext context) {
  var recipeHandler = context.watch<RecipeHandler>();
  //var uiController = Provider.of<UIController>(context, listen: false);
  var recipes = recipeHandler.bestMatches;

  List<Widget> items = [];

  for (var recipe in recipes) {
    items.add(
      RecipeListItem(
        recipe,
        onTap: () {
          //uiController.selectRecipe(recipe);
        },
      ),
    );
  }

  return ListView(
    children: items,
  );
}
}
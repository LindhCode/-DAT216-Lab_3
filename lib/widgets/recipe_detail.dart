import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

      return Card(
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(      
                  icon: Icon(Icons.close),
                  onPressed: () {
                  uiController.deselectRecipe();
                  },
                ),
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _image(recipe),
                      SizedBox(height: AppTheme.paddingTiny),
                      Text("Ingredienser", style: AppTheme.smallHeading,),
                      SizedBox(height: AppTheme.paddingTiny),
                      Text(recipe.servings.toString() + " portioner"),
                      for (int i=0 ; i< recipe.ingredients.length ; i++) 
                        Row(
                          children: [
                            SizedBox(width: AppTheme.paddingMediumSmall,),
                            Text(recipe.ingredients[i].toString()),
                        ],)
                      
                      ],
                    ),
                ),
                Expanded(
                  child: 
                    Padding(
                      padding: EdgeInsets.all(AppTheme.paddingMedium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(recipe.name, style: AppTheme.largeHeading),
                        if (MainIngredient.icon(recipe.mainIngredient) != null && Difficulty.icon(recipe.difficulty) != null) ...[
                          Row(
                            children: [
                              MainIngredient.icon(recipe.mainIngredient)!,
                              const SizedBox(width: AppTheme.paddingTiny),
                              Difficulty.icon(recipe.difficulty, width: 60)!,
                              const SizedBox(width: AppTheme.paddingTiny),
                              Text(recipe.time.toString()+ " minuter ", style: AppTheme.smallHeading),
                              const SizedBox(width: AppTheme.paddingTiny),
                              Text(recipe.price.toString()+ "kr", style: AppTheme.smallHeading),
                            ],),
                        SizedBox(height: AppTheme.paddingMediumSmall),
                        Text(recipe.description),
                        SizedBox(height: AppTheme.paddingLarge),
                        Text("Tillagning", style: AppTheme.mediumHeading),
                        SizedBox(height: AppTheme.paddingMediumSmall),
                        Text(recipe.instruction)
                        ],
                        ],
                      ),
                    )
                )
              ],
            )
          ],
        )
      );


    //return Row(
      //children: [
        //SizedBox(width: 60),
        //recipe.customImage(height: 300, width: 300),
        //SizedBox(width: 10),
        //Container(child: Text(recipe.name, style: TextStyle(fontSize: 20))),
        //IconButton(      icon: Icon(Icons.close),
          //onPressed: () {
            //uiController.deselectRecipe();
          //},
        //),
        
      //],
    
    //);
  }

  Widget _image(Recipe recipe) {
    var flagImage = Cuisine.flag(recipe.cuisine, width: 60.0);
    var square = ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: 240,
        height: 240,
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );
    return Stack(
      children: [
        square,
        Positioned(bottom: 8, right: 8, child: flagImage!)
      ],
    );
  }
}
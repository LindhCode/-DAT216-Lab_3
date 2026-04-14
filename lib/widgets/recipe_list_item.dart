import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.lightGreenAccent.withAlpha(30),
        onTap: onTap,
        child: SizedBox(
          height: 128,
          child: Row(
            children: [
              SizedBox(width: AppTheme.paddingMediumSmall),
              _image(recipe),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppTheme.paddingMediumSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: AppTheme.mediumHeading,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppTheme.paddingTiny),
                      Text(
                        recipe.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          if (MainIngredient.icon(recipe.mainIngredient) != null && Difficulty.icon(recipe.difficulty) != null) ...[
                            MainIngredient.icon(recipe.mainIngredient)!,
                            const SizedBox(width: AppTheme.paddingTiny),
                            Difficulty.icon(recipe.difficulty, width: 48)!,
                            const SizedBox(width: AppTheme.paddingTiny),
                          ],
                          Text(recipe.time.toString()+ " minuter "),
                          const SizedBox(width: AppTheme.paddingTiny),
                          Text(recipe.price.toString()+ "kr"),

                          
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _image(Recipe recipe) {
  var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);
    var square = ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: 104,
        height: 104,
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
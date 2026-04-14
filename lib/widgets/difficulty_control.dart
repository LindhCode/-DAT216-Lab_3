import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';

class DifficulyControl extends StatefulWidget {
  const DifficulyControl({super.key});

  @override
  State<DifficulyControl> createState() => _DifficulyControlState();
}

class _DifficulyControlState extends State<DifficulyControl> {
  String _difficulty = Difficulty.labels[0];
  @override
  Widget build(BuildContext context) {

    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    var labels = Difficulty.labels;
    var icons = Difficulty.icons;

    return RadioGroup<String>(
      groupValue: _difficulty,
      onChanged: (value) {
        setState(() {
          _difficulty = value!;
        });
        recipeHandler.setDifficulty(value);
      },
      child: Column(
        children: [
          for (int i = 0; i < labels.length; i++)
            RadioListTile<String>(
              dense: true,
              title: Row(
                children: [
                  if (icons[i] != null) ...[
                    icons[i]!,
                  ],
                  Text(labels[i])
                ]
              ),
              value: labels[i],
            ),
        ],
        ),
    );
  }
}

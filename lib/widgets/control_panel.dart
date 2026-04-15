
import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingridient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  final double width;

  static const TextStyle smallHeading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  const ControlPanel({
    super.key,
    this.width = 320,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.paddingMedium), 
      child: Container(
        width: width,
        color: const Color.fromARGB(255, 248, 249, 245),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\nHitta ett recept som passar genom att ändra inställningarna nedan",
                textAlign: TextAlign.left,
              ),
            ),
            Padding (
              padding: const EdgeInsets.only(top: AppTheme.paddingMedium, bottom: AppTheme.paddingMedium, right: AppTheme.paddingLarge), 
              child: Column(
                children: const [
                  IngredientControl(),
                  KitchenControl(),
                ],
              ),
            ),
            Column(
              children: const [
                Row(
                  children: [
                    SizedBox(child: Text("Svårighetsgrad", style: AppTheme.smallHeading,)),
                  ],
                ),
                DifficulyControl(),
              ],
            ),
            Column(
              children: const [
                SizedBox(height: AppTheme.paddingMediumSmall),
                Row(
                  children: [
                    Text("Maxpris", style: AppTheme.smallHeading,),
                  ]
                ),
                PriceControl(),
                SizedBox(height: AppTheme.paddingMediumSmall),
                Row(children: [
                  Text("Maxtid", style: AppTheme.smallHeading,),
                ],),
                TimeControl(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
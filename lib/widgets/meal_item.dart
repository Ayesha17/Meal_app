import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
Stack(
  children: [
    ClipRRect(borderRadius: BorderRadius.only(
      // topLeft: Radi
    ),)
  ],
)
          ],
        ),
      ),
    );
  }
}

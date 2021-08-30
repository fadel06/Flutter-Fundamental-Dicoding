import 'package:flutter/material.dart';
import 'package:submission_1/model/drink.dart';
import 'package:submission_1/model/food.dart';

class FoodCard extends StatelessWidget {
  final List<Food> foods;
  const FoodCard({required this.foods});

  Widget _buildTiles() {
    List<Widget> tiles = <Widget>[];
    for (int i = 0; i < foods.length; i++) {
      ListTile items = ListTile(
        leading: Icon(Icons.food_bank_outlined),
        title: Text(foods[i].name),
      );
      tiles.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Card(elevation: 4, child: items)));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles();
  }
}

class DrinkCard extends StatelessWidget {
  final List<Drink> drinks;
  const DrinkCard({required this.drinks});

  Widget _buildTiles() {
    List<Widget> tiles = <Widget>[];
    for (int i = 0; i < drinks.length; i++) {
      ListTile items = ListTile(
        leading: Icon(Icons.local_drink_outlined),
        title: Text(drinks[i].name),
      );
      tiles.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Card(elevation: 4, child: items)));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildTiles());
  }
}

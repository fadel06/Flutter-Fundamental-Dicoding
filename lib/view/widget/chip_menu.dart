import 'package:flutter/material.dart';
import 'package:submission_1/data/model/menu.dart';
import 'package:submission_1/utils/styles.dart';
import 'package:submission_1/view/widget/food_drink_card.dart';

class ChipMenu extends StatefulWidget {
  final Menu menu;

  const ChipMenu({required this.menu});
  @override
  _ChipMenuState createState() => _ChipMenuState();
}

class _ChipMenuState extends State<ChipMenu> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  List<String> _options = ['Food', 'Drink'];
  List<IconData> _icons = [
    Icons.food_bank_outlined,
    Icons.local_drink_outlined
  ];
  late List<Widget> chips;

  Widget _buildChips() {
    chips = <Widget>[];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i],
            style: TextStyle(
                color: _selectedIndex == i ? Colors.white : primaryDarkColor)),
        avatar: Icon(_icons[i],
            color: _selectedIndex == i ? Colors.white : primaryDarkColor),
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.grey.withOpacity(0.2),
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(choiceChip);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        _buildChips(),
        _selectedIndex == 0
            ? FoodCard(foods: widget.menu.foods)
            : DrinkCard(drinks: widget.menu.drinks)
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:submission_1/data/model/menu.dart';
import 'package:submission_1/view/widget/chip_menu.dart';

class MenutTab extends StatelessWidget {
  final Menu menu;
  const MenutTab({required this.menu});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [SizedBox(height: 20), ChipMenu(menu: menu)],
      ),
    );
  }
}

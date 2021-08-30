import 'package:submission_1/model/drink.dart';
import 'package:submission_1/model/food.dart';

class Menu {
  late List<Food> foods;
  late List<Drink> drinks;

  Menu({required this.foods, required this.drinks});

  Menu.fromJson(Map<String, dynamic> menu) {
    foods = <Food>[];
    menu['foods'].forEach((food) {
      foods.add(new Food.fromJson(food));
    });
    drinks = <Drink>[];
    menu['drinks'].forEach((drink) {
      drinks.add(new Drink.fromJson(drink));
    });
  }
}

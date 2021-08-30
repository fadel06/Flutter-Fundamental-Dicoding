import 'dart:convert';

import 'package:submission_1/model/menu.dart';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String picture;
  late String city;
  late double rating;
  late Menu menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.city,
    required this.rating,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    picture = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'].toDouble();
    menus = Menu.fromJson(restaurant['menus']);
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }
  final Map<String, dynamic> data = jsonDecode(json);
  return data['restaurants']
      .map<Restaurant>((restaurant) => Restaurant.fromJson(restaurant))
      .toList();
}

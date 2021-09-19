import 'dart:convert';

import 'package:submission_1/data/model/restaurant.dart';

DetailRestaurantResult detailRestaurantResultFromJson(String str) =>
    DetailRestaurantResult.fromJson(json.decode(str));

String detailRestaurantResultToJson(DetailRestaurantResult data) =>
    json.encode(data.toJson());

class DetailRestaurantResult {
  DetailRestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  Restaurant restaurant;

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantResult(
        error: json["error"],
        message: json["message"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toJson(),
      };
}

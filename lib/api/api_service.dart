import 'package:submission_1/data/response/detail_restaurant.dart';
import 'package:submission_1/data/response/restaurant_result.dart';
import 'package:http/http.dart' as http;
import 'package:submission_1/data/response/search_restaurant_result.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  static final String baseImageUrl =
      'https://restaurant-api.dicoding.dev/images/medium/';

  Future<RestaurantResult> fetchRestaurants() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));

    if (response.statusCode == 200) {
      return restaurantListFromJson(response.body);
    } else {
      throw Exception('Failed to fetch restaurant data');
    }
  }

  Future<DetailRestaurantResult> fetchDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + "/detail/" + id));

    if (response.statusCode == 200) {
      return detailRestaurantResultFromJson(response.body);
    } else {
      throw Exception("Failed to fetch detail of restaurant [$id]");
    }
  }

  Future<SearchRestaurantResult> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=$query'));
    if (response.statusCode == 200) {
      return searchRestaurantsResultFromJson(response.body);
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }
}

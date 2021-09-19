import 'package:flutter/material.dart';
import 'package:submission_1/api/api_service.dart';
import 'package:submission_1/data/response/restaurant_result.dart';
import 'package:submission_1/utils/constant.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchRestaurants();
  }

  late RestaurantResult _restaurantResult;
  RestaurantResult get list => _restaurantResult;

  late ResultState _state;
  ResultState get state => _state;

  late String _message;
  String get message => _message;

  Future<dynamic> _fetchRestaurants() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final data = await apiService.fetchRestaurants();

      if (data.restaurants.isNotEmpty) {
        _state = ResultState.HasData;
        _restaurantResult = data;
        notifyListeners();
        return _restaurantResult;
      } else if (data.restaurants.isEmpty) {
        _state = ResultState.NoData;
        _message = data.message;
        notifyListeners();
        return _message;
      } else {
        _state = ResultState.Error;
        _message = data.message;
        notifyListeners();
        return _message;
      }
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error --> $e';
      notifyListeners();
      return _message;
    }
  }
}

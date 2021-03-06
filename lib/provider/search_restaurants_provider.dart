import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:submission_1/api/api_service.dart';
import 'package:submission_1/data/response/search_restaurant_result.dart';
import 'package:submission_1/utils/constant.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService});

  late SearchRestaurantResult _searchResult;
  SearchRestaurantResult get searchResult => _searchResult;

  ResultState _state = ResultState.Empty;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  void setState(ResultState newState) {
    _state = newState;
    notifyListeners();
  }

  TextEditingController _controller = TextEditingController();
  TextEditingController get inputController => _controller;

  Future<dynamic> searchRestaurants(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final data = await apiService.searchRestaurant(query);

      if (data.founded > 0) {
        _state = ResultState.HasData;
        _searchResult = data;
        notifyListeners();
        return _searchResult;
      } else if (data.founded <= 0) {
        _state = ResultState.NoData;
        _message = "Items you're searching are not found!";
        notifyListeners();
        return _message;
      } else {
        _state = ResultState.Error;
        _message = "Error --> Something went wrong!";
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

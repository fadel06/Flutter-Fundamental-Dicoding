import 'package:flutter/material.dart';
import 'package:submission_1/api/api_service.dart';
import 'package:submission_1/data/response/detail_restaurant.dart';
import 'package:submission_1/utils/constant.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _fetchDetail(this.id);
  }

  late DetailRestaurantResult _detailRestaurantResult;
  DetailRestaurantResult get restaurant => _detailRestaurantResult;

  late ResultState _state;
  ResultState get state => _state;

  late String _message;
  String get message => _message;

  Future<dynamic> _fetchDetail(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final data = await apiService.fetchDetailRestaurant(id);

      if (!data.error) {
        _state = ResultState.HasData;
        _detailRestaurantResult = data;
        notifyListeners();
        return _detailRestaurantResult;
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

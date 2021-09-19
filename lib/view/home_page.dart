import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_1/data/response/restaurant_result.dart';
import 'package:submission_1/provider/restaurant_provider.dart';
import 'package:submission_1/utils/constant.dart';
import 'package:submission_1/view/widget/error_view.dart';
import 'package:submission_1/view/widget/loading_view.dart';
import 'package:submission_1/view/widget/restaurant_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<RestaurantProvider>(
      builder: (ctx, provider, _) {
        if (provider.state == ResultState.Loading) {
          return LoadingView(message: "Menyiapkan rekomendasi restoran");
        } else if (provider.state == ResultState.Error) {
          return ErrorView(message: 'Gagal Memuat, Periksa Koneksi Anda');
        } else {
          final List<Restaurant> restaurants = provider.list.restaurants;
          return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return RestaurantCard(restaurant: restaurants[index]);
              });
        }
      },
    ));
  }
}

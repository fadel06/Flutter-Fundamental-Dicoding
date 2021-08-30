import 'package:flutter/material.dart';
import 'package:submission_1/model/restaurant.dart';
import 'package:submission_1/view/detail.dart';
import 'package:submission_1/view/home.dart';
import 'package:submission_1/view/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  HomePage.routeName: (context) => HomePage(),
  DetailPage.routeName: (context) => DetailPage(
      restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
};

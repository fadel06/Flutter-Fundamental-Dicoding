import 'package:flutter/material.dart';
import 'package:submission_1/view/detail_page.dart';
import 'package:submission_1/view/main_page.dart';
import 'package:submission_1/view/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  MainPage.routeName: (context) => MainPage(),
  DetailPage.routeName: (context) =>
      DetailPage(id: ModalRoute.of(context)?.settings.arguments as String),
};

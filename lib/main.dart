import 'package:flutter/material.dart';
import 'package:submission_1/utils/routes.dart';
import 'package:submission_1/utils/styles.dart';
import 'package:submission_1/view/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Restaurant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          // accentColor: primaryDarkColor,
          // scaffoldBackgroundColor: primaryLightColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: myTextTheme,
          appBarTheme: AppBarTheme(
              textTheme: myTextTheme.apply(bodyColor: primaryColor),
              elevation: 0)),
      initialRoute: SplashPage.routeName,
      routes: routes,
    );
  }
}

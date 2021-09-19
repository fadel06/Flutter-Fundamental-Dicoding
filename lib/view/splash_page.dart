import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission_1/utils/styles.dart';
import 'package:submission_1/view/main_page.dart';

class SplashPage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, MainPage.routeName));

    return Scaffold(
        body: Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Lottie.asset('assets/animations/restaurant.json'),
            Text(
              'Find The Best Restaurant',
              style: myTextTheme.headline4,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}

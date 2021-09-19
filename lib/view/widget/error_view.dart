import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission_1/utils/styles.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/error.json',
              height: MediaQuery.of(context).size.height / 3),
          Text(this.message,
              textAlign: TextAlign.center, style: myTextTheme.headline6),
        ],
      ),
    );
  }
}

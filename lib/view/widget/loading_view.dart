import 'package:flutter/material.dart';
import 'package:submission_1/utils/styles.dart';

class LoadingView extends StatelessWidget {
  final String message;

  LoadingView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 120.0),
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              message,
              style: myTextTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}

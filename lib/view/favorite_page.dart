import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:submission_1/utils/styles.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/heart-break-or-unlike.json',
              height: MediaQuery.of(context).size.height / 3),
          Text('Belum ada restaurant favorite',
              textAlign: TextAlign.center, style: myTextTheme.headline6),
        ],
      ),
    );
  }
}

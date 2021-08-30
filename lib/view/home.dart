import 'package:flutter/material.dart';
import 'package:submission_1/model/restaurant.dart';
import 'package:submission_1/view/widget/restaurant_card.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/restaurant.png"),
                width: 32.0,
                height: 32.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'Find Restaurant',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.apply(color: Colors.white),
              )
            ],
          ),
        ),
        body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants =
                parseRestaurants(snapshot.data);
            return ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(restaurant: restaurants[index]);
                });
          },
        ));
  }
}

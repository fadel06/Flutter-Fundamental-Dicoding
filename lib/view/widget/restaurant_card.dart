import 'package:flutter/material.dart';
import 'package:submission_1/model/restaurant.dart';
import 'package:submission_1/utils/styles.dart';
import 'package:submission_1/view/detail.dart';
import 'package:submission_1/view/widget/favorite_button.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.yellow,
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurant);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: MediaQuery.of(context).size.width,
        height: 160.0,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0,
                  spreadRadius: -6.0),
            ],
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.35), BlendMode.multiply),
                image: NetworkImage(restaurant.picture),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Align(
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 4, 4, 0),
                  child: FavoriteButton()),
              alignment: Alignment.topRight,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  restaurant.name,
                  style: myTextTheme.headline5?.apply(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: primaryLightColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(restaurant.rating.toString(),
                            style: myTextTheme.bodyText1
                                ?.apply(color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: primaryLightColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(restaurant.city,
                            style: myTextTheme.bodyText1
                                ?.apply(color: Colors.white))
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            )
          ],
        ),
      ),
    );
  }
}

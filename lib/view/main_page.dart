import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_1/api/api_service.dart';
import 'package:submission_1/provider/restaurant_provider.dart';
import 'package:submission_1/provider/search_restaurants_provider.dart';
import 'package:submission_1/view/favorite_page.dart';
import 'package:submission_1/view/home_page.dart';
import 'package:submission_1/view/search_page.dart';

class MainPage extends StatefulWidget {
  static String routeName = '/main';
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  List<Widget> pageList = [HomePage(), SearchPage(), FavoritePage()];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
            create: (_) => RestaurantProvider(apiService: ApiService())),
        ChangeNotifierProvider<SearchRestaurantProvider>(
            create: (_) => SearchRestaurantProvider(apiService: ApiService()))
      ],
      child: Scaffold(
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
        ),
        body: pageList[pageIndex],
      ),
    );
  }
}

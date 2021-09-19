import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_1/provider/search_restaurants_provider.dart';
import 'package:submission_1/utils/constant.dart';
import 'package:submission_1/utils/styles.dart';
import 'package:submission_1/view/widget/empty_view.dart';
import 'package:submission_1/view/widget/error_view.dart';
import 'package:submission_1/view/widget/loading_view.dart';
import 'package:submission_1/view/widget/restaurant_card.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  void _searchList(String query, SearchRestaurantProvider provider) {
    if (query.isEmpty) return provider.setState(ResultState.Empty);
    provider.searchRestaurants(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Consumer<SearchRestaurantProvider>(
          builder: (ctx, provider, _) {
            if (provider.state == ResultState.Empty) {
              return _buildSearchableListUI(
                context,
                provider,
                Column(
                  children: [
                    SizedBox(height: 12.0),
                    Icon(
                      Icons.map,
                      size: MediaQuery.of(context).size.height / 5.6,
                      color: primaryDarkColor.withOpacity(0.4),
                    ),
                    Text('Eksplore restaurant favorite disini',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 36.6,
                            fontWeight: FontWeight.bold,
                            color: primaryDarkColor),
                        textAlign: TextAlign.center)
                  ],
                ),
              );
            } else if (provider.state == ResultState.Loading) {
              return _buildSearchableListUI(
                context,
                provider,
                Container(
                  margin: EdgeInsets.only(top: 36.0),
                  child: Center(
                    child: LoadingView(
                      message: "Sedang mencari",
                    ),
                  ),
                ),
              );
            } else if (provider.state == ResultState.NoData) {
              return _buildSearchableListUI(
                context,
                provider,
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.0),
                    child: EmptyView(
                      message: 'Restaurant tidak ditemukan',
                    )),
              );
            } else if (provider.state == ResultState.Error) {
              return _buildSearchableListUI(
                context,
                provider,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  child: ErrorView(
                    message: provider.message,
                  ),
                ),
              );
            }

            return _buildSearchableListUI(
              context,
              provider,
              ListView.builder(
                itemCount: provider.searchResult.restaurants.length,
                itemBuilder: (ctx, index) {
                  final _item = provider.searchResult.restaurants[index];
                  return RestaurantCard(
                    restaurant: _item,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchableListUI(
      BuildContext context, SearchRestaurantProvider provider, Widget child) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: provider.inputController,
              onChanged: (text) {
                _searchList(text, provider);
              },
              onSubmitted: (text) {},
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryDarkColor,
                    ),
                  ),
                  fillColor: primaryDarkColor,
                  focusColor: primaryDarkColor,
                  hoverColor: primaryDarkColor,
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.search, color: primaryDarkColor),
                    onTap: () {
                      _searchList(provider.inputController.text, provider);
                    },
                  ),
                  hintText: 'Search here',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: child,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_1/api/api_service.dart';
import 'package:submission_1/provider/detail_restaurant_provider.dart';
import 'package:submission_1/utils/constant.dart';
import 'package:submission_1/view/menu_tab.dart';
import 'package:submission_1/view/overview_tab.dart';
import 'package:submission_1/view/widget/error_view.dart';
import 'package:submission_1/view/widget/loading_view.dart';
import 'package:submission_1/view/widget/sliver_presistent_header_delegate_impl.dart';

class DetailPage extends StatefulWidget {
  static String routeName = '/detail';
  final String id;

  const DetailPage({required this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<Widget> listTab = [
    Tab(
      icon: Icon(Icons.article_outlined),
      text: 'Overview',
    ),
    Tab(
      icon: Icon(Icons.menu_book_outlined),
      text: 'Menu',
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: listTab.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) =>
          DetailRestaurantProvider(apiService: ApiService(), id: widget.id),
      child: Scaffold(
        body: Consumer<DetailRestaurantProvider>(
          builder: (ctx, provider, _) {
            if (provider.state == ResultState.Loading) {
              return LoadingView(message: "Memuat, mohon menunggu");
            } else if (provider.state == ResultState.Error) {
              return ErrorView(message: "Gagal Memuat, Periksa Koneksi Anda");
            } else {
              return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        leading: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            customBorder: CircleBorder(),
                            splashColor: Colors.yellow,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: true,
                        expandedHeight: 160.0,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            provider.restaurant.restaurant.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.apply(color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          background: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.35),
                                        BlendMode.multiply),
                                    image: NetworkImage(provider
                                        .restaurant.restaurant
                                        .pictureUrl()),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverPresistentHeaderDelegateImpl(
                            tabBar: TabBar(
                              isScrollable: false,
                              labelColor: Colors.white,
                              indicatorColor: Colors.white,
                              tabs: listTab,
                              onTap: (index) {},
                              controller: tabController,
                            ),
                          ))
                    ];
                  },
                  body: TabBarView(
                    controller: tabController,
                    children: [
                      OverviewTab(restaurant: provider.restaurant.restaurant),
                      MenutTab(menu: provider.restaurant.restaurant.menus)
                    ],
                  ));
            }
          },
        ),
      ),
    );
  }
}

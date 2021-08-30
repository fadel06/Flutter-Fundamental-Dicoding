import 'package:flutter/material.dart';
import 'package:submission_1/model/restaurant.dart';
import 'package:submission_1/view/menu_tab.dart';
import 'package:submission_1/view/overview_tab.dart';
import 'package:submission_1/view/widget/sliver_presistent_header_delegate_impl.dart';

class DetailPage extends StatefulWidget {
  static String routeName = '/detail';
  final Restaurant restaurant;

  const DetailPage({required this.restaurant});

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
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                    widget.restaurant.name,
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
                            image: NetworkImage(widget.restaurant.picture),
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
              OverviewTab(restaurant: widget.restaurant),
              MenutTab(menu: widget.restaurant.menus)
            ],
          )),
    );
  }
}

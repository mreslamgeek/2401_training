import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer/drawer.dart';
import 'package:flutter_application_1/favorite/favorite.dart';
import 'package:flutter_application_1/searsh/searsh.dart';
import 'package:flutter_application_1/tabs/mens_tab.dart';
import 'package:flutter_application_1/tabs/popular_tab.dart';
import 'package:flutter_application_1/tabs/sale_tab.dart';
import 'package:flutter_application_1/tabs/womens_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          key: scaffoldkey,
          endDrawer: CustomDrawer(),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'Mens',
                ),
                Tab(
                  text: 'Womens',
                ),
                Tab(
                  text: 'Sale',
                ),
              ],
            ),
            title: const Text(
              'Geeta.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none_sharp),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Favorite()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Searsh(),
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          body: const TabBarView(children: [
            PupularTab(),
            MensTab(),
            WomensTab(),
            SaleTab(),
          ])),
    );
  }
}

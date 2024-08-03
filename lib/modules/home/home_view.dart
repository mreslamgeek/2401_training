import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/drawer/drawer.dart';
import 'package:flutter_application_1/modules/favorite/favorite.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_application_1/modules/home/tabs/product_list.dart';
import 'package:flutter_application_1/modules/home/widgets/custom_tab_bar.dart';
import 'package:flutter_application_1/modules/searsh/searsh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const CustomDrawer(),
      appBar: _buildAppBar(context, scaffoldkey),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cats = context.read<HomeCubit>().categories;
          if (state is CategoryLoaded || cats != null) {
            return DefaultTabController(
              length: cats!.length,
              child: Column(
                children: [
                  CustomTabBarSection(cats: cats),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: cats.map((e) => const ProductsList()).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldkey) {
    return AppBar(
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
    );
  }
}

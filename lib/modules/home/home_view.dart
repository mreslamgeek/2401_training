import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/drawer/drawer.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_application_1/modules/home/tabs/product_list.dart';
import 'package:flutter_application_1/modules/home/widgets/custom_tab_bar.dart';
import 'package:flutter_application_1/modules/searsh/searsh.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldkey,
      drawer: const CustomDrawer(),
      appBar: _buildAppBar(context, scaffoldkey),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final cats = context.read<HomeCubit>().categories;

          if (state is CategoryLoaded) {
            if (cats == null || cats.isEmpty == true) {
              return const Center(child: Text('No Date , Please Check Internet'));
            } else {
              return DefaultTabController(
                length: cats.length,
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
          } else {
            if (cats == null || cats.isEmpty == true) {
              return const Center(child: Text('No Date , Please Check Internet'));
            } else {
              return DefaultTabController(
                length: cats.length,
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
          }
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
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Searsh(),
            ));
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none_sharp),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            // context
            //     .read<CartCubit>()
            //     .getCart()
            //     .then((value) => navKey.currentState?.pushNamed(AppRoutes.CART));

            navKey.currentState?.pushNamed(AppRoutes.CART);
          },
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/widgets/custom_product_card.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 25),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Text(
                  'Filter & Sort',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 18),
                Icon(Icons.timeline),
              ],
            ),
            Row(
              children: [
                Icon(Icons.grid_view),
                Icon(Icons.grid_view_sharp),
              ],
            )
          ]),
          const SizedBox(height: 25),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final prods = context.read<HomeCubit>().products;

                if (state is ProductsLoaded || prods != null) {
                  return GridView.builder(
                    itemCount: prods!.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 14,
                    ),
                    itemBuilder: (context, index) => CustomProductCard(item: prods[index]),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}

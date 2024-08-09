import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/global/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter_application_1/global/widgets/custom_quntity_selector.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListItem extends StatelessWidget {
  final Product item;
  const CartListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var cat = context.read<HomeCubit>().findCategory(item.categoryId!);

    return GestureDetector(
      onTap: () {
        navKey.currentState?.pushNamed(AppRoutes.SINGLEPRODUCT, arguments: item);
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(color: const Color(0xffF1F4FB), borderRadius: BorderRadius.circular(24)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.image ?? '',
                width: MediaQuery.of(context).size.width * 0.3,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6342E8),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    cat?.name ?? '',
                    style: const TextStyle(color: Color(0xffA1A1A1)),
                  ),
                  Expanded(
                      child: QuantitySelector(
                    quantity: item.pivot?.quantity ?? 1,
                    onIncrement: (int newQuntity) {
                      item.pivot = Pivot(quantity: newQuntity);
                      context.read<CartCubit>().updateCart(item);
                    },
                    onDecrement: (int newQuntity) {
                      item.pivot = Pivot(quantity: newQuntity);
                      context.read<CartCubit>().updateCart(item);
                    },
                  )),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '\$${item.price}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

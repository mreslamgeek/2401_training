import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/category.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/global/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter_application_1/global/widgets/custom_quntity_selector.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_application_1/utils/toast_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

class SingleProductView extends StatelessWidget {
  const SingleProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Product item = ModalRoute.of(context)!.settings.arguments as Product;

    final homeCubit = context.read<HomeCubit>();

    Category? productCat = homeCubit.findCategory(item.categoryId!);

    return Scaffold(
      backgroundColor: const Color(0xffF1F4FB),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250,
                width: double.infinity,
                color: const Color(0xffF1F4FB),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                        top: 0, right: 16, child: Icon(Icons.favorite_border_rounded, size: 35)),
                    Image.network(item.image!)
                  ],
                )),
            Container(
              height: 540,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productCat?.name ?? ''),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.name!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${item.price} USD',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.grey[500]),
                      ],
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {
                        if (state is CartAddedProduct) {
                          showSuccessToast('${state.newProduct.name} Added To Cart');
                        }
                        if (state is CartProductIncremented) {
                          showSuccessToast(
                              '${state.newProduct.name} quntntity update to ${state.newProduct.pivot?.quantity}');
                        }
                        if (state is CartProductDecremented) {
                          if (state.newProduct.pivot?.quantity == 0) {
                            showErrorToast('${state.newProduct.name} removed from cart');
                          } else {
                            showSuccessToast(
                                '${state.newProduct.name} quntntity update to ${state.newProduct.pivot?.quantity}');
                          }
                        }
                      },
                      builder: (context, state) {
                        var productInCart =
                            context.read<CartCubit>().checkIfProductInCart(item.id!);

                        if (productInCart == null) {
                          return QuantitySelector(
                            quantity: 0,
                            onIncrement: (int newQuntity) {
                              item.pivot = Pivot(quantity: 1);
                              context.read<CartCubit>().addProductToCart(item);
                            },
                            onDecrement: (int newQuntity) {
                              item.pivot = Pivot(quantity: newQuntity);
                              context.read<CartCubit>().updateCart(item);
                            },
                          );
                        } else {
                          return QuantitySelector(
                            quantity: productInCart.pivot!.quantity!,
                            onIncrement: (int newQuntity) {
                              item.pivot = Pivot(quantity: newQuntity);
                              context.read<CartCubit>().updateCart(item);
                            },
                            onDecrement: (int newQuntity) {
                              item.pivot = Pivot(quantity: newQuntity);
                              context.read<CartCubit>().updateCart(item);
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'DESCRIPTION',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(item.description!),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'select size',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GroupButton(
                      buttons: const ['S', 'M', 'L', 'XL', 'XXL'],
                      onSelected: (val, index, isSelected) {
                        log(val.toString());
                        log(index.toString());
                        log(isSelected.toString());
                      },
                      options: GroupButtonOptions(
                          borderRadius: BorderRadius.circular(10),
                          selectedColor: const Color(0xff6342E8),
                          unselectedColor: const Color(0xffF1F4FB),
                          unselectedTextStyle: const TextStyle(color: Colors.black),
                          selectedTextStyle: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          item.pivot = Pivot(quantity: 1);
                          context.read<CartCubit>().addProductToCart(item);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff6342E8)),
                        child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Icon(
                            Icons.card_travel_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            '  ADD TO Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

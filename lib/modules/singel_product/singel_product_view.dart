import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/category.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/modules/card/card.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

class SingleProductView extends StatelessWidget {
  const SingleProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Product item = ModalRoute.of(context)!.settings.arguments as Product;

    final homeCubit = context.read<HomeCubit>();

    Category productCat =
        homeCubit.categories!.firstWhere((element) => element.id == item.categoryId);

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
                    Text(productCat.name!),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12), color: Colors.white),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '-   1   +',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share_outlined))
                      ],
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
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const MyCard()),
                          );
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

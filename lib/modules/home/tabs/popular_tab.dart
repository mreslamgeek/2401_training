import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/widgets/custom_product_card.dart';

class PupularTab extends StatelessWidget {
  const PupularTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = ['one', 'tow', 'three', 'fore'];
    List<String> images = [
      'assets/images/hoodie    .png',
      'assets/images/jacket 1.png',
      'assets/images/jeans 2.png',
      'assets/images/originalImage.png',
    ];
    List<String> price = ['100', '200', '300', '400'];
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
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
              const SizedBox(
                height: 25,
              ),
              GridView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 300, mainAxisSpacing: 50),
                  itemBuilder: (context, index) {
                    return CustomProductCard(
                        productName: name[index],
                        productImage: images[index],
                        productPrice: price[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/card/Custom_my_card.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Printed Shirt', 'Leather Jacket', 'Washed Jeans', 'Pink Hoodie'];
    List<String> images = [
      'assets/images/hoodie 1.png',
      'assets/images/jacket 1.png',
      'assets/images/jeans 2.png',
      'assets/images/originalImage.png',
    ];
    List<String> price = [
      '28.00 USD',
      '36.00 USD',
      '19.00 USD',
      '45.00 USD',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My  Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: images.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return CustomMyCard(
                        cardName: name[index],
                        cardImage: images[index],
                        cardPrice: price[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

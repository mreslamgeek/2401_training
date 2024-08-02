import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/customtextfield/custom_text_field.dart';
import 'package:flutter_application_1/modules/searsh/custom_searsh.dart';

class Searsh extends StatelessWidget {
  const Searsh({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      'Pink Hoodie',
      'Light Purple ',
      'Dark Green Hoodie',
      'Turquoise Hoodie',
      'Turquoise Hoodie',
      'Turquoise Hoodie',
    ];
    List<String> images = [
      'assets/images/hoodie 1.png',
      'assets/images/hoodie 1 .png',
      'assets/images/hoodie 1 .png',
      'assets/images/hoodie    .png',
      'assets/images/hoodie    .png',
      'assets/images/hoodie    .png',
    ];
    List<String> price = ['100', '200', '300', '400', '500', '600'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find Products',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const CustomTextField(
              hint: 'Searsh',
              obscure: false,
              prefix: Icon(Icons.search_sharp),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('139 Items found for “Hoodies”'),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  return CustomSearsh(name: name[index], image: images[index], price: price[index]);
                })
          ],
        ),
      ),
    );
  }
}

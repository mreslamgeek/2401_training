import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/Buy/buy.dart';

class CustomProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  const CustomProductCard(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: 300,
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: const Color(0xffF1F4FB), borderRadius: BorderRadius.circular(12)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Custom_Buy(),
                      ));
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 35,
                    ),
                  ),
                ),
                Image.asset(productImage)
              ],
            ),
          ),
          Text(
            productName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            ' \$$productPrice',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}

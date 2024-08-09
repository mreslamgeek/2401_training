import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/product.dart';

class CustomMyCard extends StatelessWidget {
  final Product item;
  const CustomMyCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: const Color(0xffF1F4FB),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(item.image ?? ''),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.name ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6342E8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Geeta Collection',
                style: TextStyle(color: Color(0xffA1A1A1)),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '\$${item.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
                const Text(
                  '-   1   +',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

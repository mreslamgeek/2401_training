import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearsh extends StatelessWidget {
  final String price;
  final String image;
  final String name;
  const CustomSearsh(
      {super.key,
      required this.price,
      required this.image,
      required this.name});

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
                color: const Color(0xffF1F4FB),
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.favorite_border,
                    size: 35,
                  ),
                ),
                Image.asset(image)
              ],
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            ' \$$price',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}

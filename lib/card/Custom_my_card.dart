import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMyCard extends StatelessWidget {
  final cardName;
  final cardImage;
  final cardPrice;
  const CustomMyCard(
      {super.key, this.cardName, this.cardImage, this.cardPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Color(0xffF1F4FB),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(cardImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cardName,
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
                '\$$cardPrice',
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

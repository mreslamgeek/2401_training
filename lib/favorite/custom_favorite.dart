import 'package:flutter/material.dart';

class Custom_Favorite extends StatelessWidget {
  final favoriteName;
  final favoriteImage;
  final favoritePrice;
  const Custom_Favorite(
      {super.key, this.favoriteName, this.favoriteImage, this.favoritePrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: const Color(0xffF1F4FB),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(favoriteImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                favoriteName,
                style: const TextStyle(
                  fontSize: 15,
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$favoritePrice',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward))
              ],
            ),
          )
        ],
      ),
    );
  }
}

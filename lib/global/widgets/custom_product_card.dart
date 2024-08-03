import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/modules/Buy/buy.dart';

class CustomProductCard extends StatelessWidget {
  final Product item;
  const CustomProductCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xffF1F4FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                fit: StackFit.expand,
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
                      icon: const Icon(Icons.favorite_border, size: 35),
                    ),
                  ),
                  Image.network(item.image!, fit: BoxFit.cover)
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.name!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            ' \$${item.price}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}

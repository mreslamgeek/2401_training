import 'package:flutter/material.dart';
import 'package:flutter_application_1/Debit_card/Debit_card.dart';
import 'package:flutter_application_1/favorite/custom_favorite.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      'Printed Shirt',
      'Leather Jacket',
      'Washed Jeans',
      'Pink Hoodie',
      'Retro Sweater',
    ];
    List<String> images = [
      'assets/images/hoodie 1.png',
      'assets/images/jacket 1.png',
      'assets/images/jeans 2.png',
      'assets/images/originalImage.png',
      'assets/images/Rectangle 3.png',
    ];
    List<String> price = [
      '28.00USD',
      '36.00USD',
      '19.00USD',
      '45.00USD',
      '60.00USD',
    ];

    return Scaffold(
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: 45,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FloatingActionButton(
            backgroundColor: const Color(0xff6342E8),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Checkout',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.clear))
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Delivery',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Text('Select Method     '),
                                          Icon(Icons.arrow_forward_ios_rounded),
                                        ],
                                      )),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Pament',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DebitCard()));
                                      },
                                      child: Image.asset(
                                          'assets/icons/Group 6868.png'))
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Promo Code',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Text('Pick discount     '),
                                          Icon(Icons.arrow_forward_ios_rounded),
                                        ],
                                      )),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Cost',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Text('135.96     '),
                                          Icon(Icons.arrow_forward_ios_rounded),
                                        ],
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                  'By placing an order you agree to our \n Terms And Conditions.')
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  '  ADD all TO Cart',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text(
          'My  Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: 150,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return Custom_Favorite(
                              favoriteName: name[index],
                              favoriteImage: images[index],
                              favoritePrice: price[index],
                            );
                          },
                        ),
                      ],
                    ),
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

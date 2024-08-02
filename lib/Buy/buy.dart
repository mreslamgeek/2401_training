import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_application_1/card/card.dart';

class Custom_Buy extends StatelessWidget {
  const Custom_Buy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String price = '48.00';
    const String image = 'assets/images/hoodie    .png';

    return Scaffold(
      backgroundColor: const Color(0xffF1F4FB),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250,
                width: double.infinity,
                color: const Color(0xffF1F4FB),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.favorite_border_rounded,
                          size: 35,
                        )),
                    Image.asset(image)
                  ],
                )),
            Container(
              height: 540,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Geeta mens'),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Purple Hoodie ',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$$price USD',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '-   1   +',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.ios_share_outlined))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'DESCRIPTION',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book...detail',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'select size',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GroupButton(
                      buttons: ['S', 'M', 'L', 'XL', 'XXL'],
                      onSelected: (val, index, isSelected) {
                        log(val.toString());
                        log(index.toString());
                        log(isSelected.toString());
                      },
                      options: GroupButtonOptions(
                          borderRadius: BorderRadius.circular(10),
                          selectedColor: Color(0xff6342E8),
                          unselectedColor: Color(0xffF1F4FB),
                          unselectedTextStyle: TextStyle(color: Colors.black),
                          selectedTextStyle: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MyCard()),
                          );
                        },
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.card_travel_sharp,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                '  ADD TO Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ]),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff6342E8)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

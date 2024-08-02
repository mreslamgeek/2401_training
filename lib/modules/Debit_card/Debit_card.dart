import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/customtextfield/custom_text_field.dart';

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Credit / Debit card',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Image.asset('assets/images/Card.png'),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 45,
                )),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name on card',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const CustomTextField(
                    hint: 'Varat Singh Sharma',
                    obscure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Card number',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  CustomTextField(
                    hint: '4747  4747  4747  4747',
                    obscure: false,
                    suffix: Image.asset('assets/icons/mc_symbol 1.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: const Text(
                                'Expiry date',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const CustomTextField(
                              hint: '07/21',
                              obscure: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('CVC', style: TextStyle(fontWeight: FontWeight.bold)),
                              CustomTextField(
                                hint: 'CVC',
                                obscure: false,
                                suffix: Image.asset('assets/icons/Hint.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff6342E8)),
                  child: const Text(
                    'use this card',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

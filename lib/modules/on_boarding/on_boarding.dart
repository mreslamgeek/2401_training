import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Image.asset(
                'assets/images/one.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Image.asset(
                'assets/images/tow.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            right: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Geeta.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () => navKey.currentState?.pushNamed(AppRoutes.SPLASH),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.white, width: 3)),
                  child: const Text(
                    '        SHOP NOW        ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const Text(
                  '        ...       ',
                  style: TextStyle(color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

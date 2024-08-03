import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/tow.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 60,
            top: 180,
            child: Image.asset(
              'assets/icons/Shopping-bag.jpg',
              color: Colors.black,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.9),
          ),
          Positioned(
            top: 100,
            right: 100,
            left: 100,
            child: Column(
              children: [
                const Text(
                  'Geeta.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
                ),
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Create your fashion \n in your own way',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Each men and women has their own style, Geeta \n help you to create your unique style. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () => navKey.currentState?.pushNamed(AppRoutes.SIGNIN),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.black, width: 2)),
                  child: const Text(
                    '        LOG IN        ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '___  OR  ___',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    navKey.currentState?.pushNamed(AppRoutes.SIGNUP);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff6342E8),
                  ),
                  child: const Text(
                    '      Register      ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            child: Image.asset(
              'assets/icons/Vector6.jpg',
              color: const Color(0xff6342E8),
            ),
          ),
          Positioned(
            left: -20,
            child: Image.asset(
              'assets/icons/Vector6.jpg',
              color: const Color(0xff6342E8),
            ),
          ),
          Positioned(
            top: -10,
            left: -40,
            child: Image.asset(
              'assets/icons/Vector6.jpg',
              color: const Color(0xff5532E0),
            ),
          ),
          Positioned(
            bottom: 40,
            right: -30,
            child: Image.asset(
              'assets/icons/Vector9.jpg',
              color: const Color(0xff6342E8),
            ),
          ),
          Positioned(
            bottom: 20,
            right: -30,
            child: Image.asset(
              'assets/icons/Vector9.jpg',
              color: const Color(0xff7456EF),
            ),
          ),
          Positioned(
            bottom: 0,
            right: -30,
            child: Image.asset(
              'assets/icons/Vector9.jpg',
              color: const Color(0xff876BF8),
            ),
          ),
        ],
      ),
    );
  }
}

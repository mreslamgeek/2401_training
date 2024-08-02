import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/icons/undraw_Celebrating_rtuv 1.png'),
                  Positioned(
                      top: 120,
                      left: 100,
                      child: Image.asset('assets/icons/Group 6872.png')),
                  Positioned(
                    bottom: 150,
                    child: Text(
                      'Congrats! Your Order has \n           been placed',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    child: Text(
                      'Your items has been placcd and is on \n        it’s way to being processed',
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6342E8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.car_crash_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        '    Track Order',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6342E8)),
                child: Text(
                  'Continue shopping',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {},
                style:
                    TextButton.styleFrom(backgroundColor: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    Text(
                      '   Back to home',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

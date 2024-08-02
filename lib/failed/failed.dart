import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Failed extends StatelessWidget {
  const Failed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/caution.png',
              height: 150,
              width: double.infinity,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'Oh Snap! Order Failed',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                'Looks like something went wrong\n    while processing your request.'),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6342E8)),
                child: Text(
                  'Please Try Again',
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

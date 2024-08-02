import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/customtextfield/custom_text_field.dart';
import 'package:flutter_application_1/modules/home_view.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 900,
                child: Stack(children: [
                  Positioned(
                      right: 0,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          child: Image.asset(
                            'assets/icons/Vector.png',
                            color: Colors.black,
                            height: 250,
                          ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 900,
                          color: const Color(0xff6342E8).withOpacity(0.9),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  'Get’s started with Geeta.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Already have an account? Log in',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Custom_Text_Field(
                                      hint: 'Enter your name',
                                      prefix: Icon(Icons.perm_identity),
                                      obscure: false),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'E-mail',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Custom_Text_Field(
                                      hint: 'Enter your E-mail',
                                      prefix: Icon(Icons.email_outlined),
                                      obscure: false),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text('Password',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Custom_Text_Field(
                                    hint: 'Enter your password',
                                    prefix: Icon(Icons.lock),
                                    obscure: true,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Center(
                                      child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()),
                                        (Route<dynamic> route) =>
                                            false, // Remove all routes
                                      );

                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => Products_custom()));
                                    },
                                    child: const Text(
                                      '                                      Register                                        ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.indigo),
                                  )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Center(
                                      child: Text(
                                          'By  joining I agree to receive emails from Geeta.'))
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/customtextfield/custom_text_field.dart';
import 'package:flutter_application_1/screen/register.dart';

class Sign_In extends StatelessWidget {
  const Sign_In({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              Container(
                height: 900,
                width: double.infinity,
                child: Stack(children: [
                  Positioned(
                      right: 0,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          child: Image.asset('assets/icons/Vector.png',
                              color: Colors.black))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(0xff6342E8).withOpacity(0.9),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  '  Yay! You\'re back! Thanks for shopping with us.\n We have excited deals and promotions going \n on, grab your pick now! ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                Text(
                                  'Log In',
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
                          flex: 1,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'E-mail address',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Custom_Text_Field(
                                  hint: 'Enter your E-mail',
                                  prefix: Icon(Icons.email_outlined),
                                  obscure: false,
                                  suffix: Image.asset(
                                    'assets/icons/mark.jpg',
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text('Password',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Custom_Text_Field(
                                  hint: 'Enter your password',
                                  prefix: Icon(Icons.lock),
                                  obscure: true,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Checkbox(
                                          value: true, onChanged: (value) {}),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Remeber me'),
                                    ]),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style:
                                            TextStyle(color: Color(0xff6342E8)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    '                                      Log-In                                        ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo),
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Not registered yet? '),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Register(),
                                        ));
                                      },
                                      child: Text('Create an Account',
                                          style: TextStyle(
                                              color: Color(0xff6342E8))),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

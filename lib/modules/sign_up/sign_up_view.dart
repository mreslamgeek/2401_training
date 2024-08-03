import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/customtextfield/custom_text_field.dart';
import 'package:flutter_application_1/modules/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Form(
            key: signUpCubit.formKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 900,
                  child: Stack(children: [
                    Positioned(
                        right: 0,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextField(
                                      hint: 'Enter your name',
                                      prefix: const Icon(Icons.perm_identity),
                                      onSaved: (value) => signUpCubit.name = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty == true) {
                                          return 'Please enter name';
                                        }

                                        if (value.length < 3) return 'name atleast 3 chars';
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      'E-mail',
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextField(
                                      hint: 'Enter your E-mail',
                                      prefix: const Icon(Icons.email_outlined),
                                      onSaved: (value) => signUpCubit.email = value,
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty == true) {
                                          return 'Please enter email';
                                        }
                                        if (!value.contains('@') == true) {
                                          return 'Please enter valid email';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text('Password',
                                        style:
                                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    CustomTextField(
                                      hint: 'Enter your password',
                                      prefix: const Icon(Icons.lock),
                                      obscure: true,
                                      onSaved: (value) => signUpCubit.password = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty == true) {
                                          return 'Please enter password';
                                        }

                                        if (value.length < 8) return 'password atleast 8 chars';
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    BlocConsumer<SignUpCubit, SignUpState>(
                                      listener: (context, state) {
                                        if (state is SuccessState) {
                                          navKey.currentState?.pushNamed(AppRoutes.HOME);
                                        }
                                        if (state is FailuteState) {
                                          signUpCubit.formKey.currentState?.reset();
                                        }
                                      },
                                      builder: (context, state) => state is LoadingState
                                          ? const Center(child: CircularProgressIndicator())
                                          : ElevatedButton(
                                              onPressed: signUpCubit.signUp,
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.indigo),
                                              child: const Text(
                                                '                                      Register                                        ',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                    ),
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
          ),
        ));
  }
}

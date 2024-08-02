import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/customtextfield/custom_text_field.dart';
import 'package:flutter_application_1/modules/screen/register.dart';
import 'package:flutter_application_1/modules/sign_in/signin_cubit.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final signINCubit = context.read<SigninCubit>();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color(0xff6342E8).withOpacity(0.9),
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Image.asset('assets/icons/Vector.png'),
              ),
              const Positioned(
                left: 45,
                top: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '  Yay! You\'re back! Thanks for shopping with us.\n We have excited deals and promotions going \n on, grab your pick now! ',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Log In',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: context.read<SigninCubit>().formKey,
              child: BlocConsumer<SigninCubit, SigninState>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    navKey.currentState?.pushNamed(AppRoutes.HOME);
                  }
                  if (state is FailuteState) {
                    signINCubit.formKey.currentState?.reset();
                  }
                },
                builder: (context, state) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'E-mail address',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                      hint: 'Enter your E-mail',
                      prefix: const Icon(Icons.email_outlined),
                      obscure: false,
                      onSaved: (value) => signINCubit.email = value,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty == true) {
                          return 'Please enter email';
                        }
                        if (!value.contains('@') == true) return 'Please enter valid email';
                        return null;
                      },
                      suffix: Image.asset('assets/icons/mark.jpg'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Password',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    CustomTextField(
                      hint: 'Enter your password',
                      prefix: const Icon(Icons.lock),
                      obscure: true,
                      onSaved: (value) => signINCubit.password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty == true) return 'Please enter password';

                        if (value.length < 8) return 'password atleast 8 chars';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Remeber me'),
                        ]),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Color(0xff6342E8)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<SigninCubit, SigninState>(
                      builder: (context, state) => state is LoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () {
                                context.read<SigninCubit>().signIn();
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                              child: const Text(
                                '                                      Log-In                                        ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not registered yet? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Register(),
                            ));
                          },
                          child: const Text('Create an Account',
                              style: TextStyle(color: Color(0xff6342E8))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter_application_1/modules/cart/cart_view.dart';
import 'package:flutter_application_1/modules/home/home_view.dart';
import 'package:flutter_application_1/modules/on_boarding/cubit/onboarding_cubit.dart';
import 'package:flutter_application_1/modules/on_boarding/on_boarding.dart';
import 'package:flutter_application_1/modules/order/order_view.dart';
import 'package:flutter_application_1/modules/sign_in/sign_in_view.dart';
import 'package:flutter_application_1/modules/sign_in/signin_cubit.dart';
import 'package:flutter_application_1/modules/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/modules/sign_up/sign_up_view.dart';
import 'package:flutter_application_1/modules/singel_product/singel_product_view.dart';
import 'package:flutter_application_1/modules/single_notificaiton/single_notification_view.dart';
import 'package:flutter_application_1/modules/single_order/view/single_order.dart';
import 'package:flutter_application_1/modules/splash/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const INTIAL = '/';
  static const SPLASH = 'splash';
  static const SIGNIN = 'sign-in';
  static const SIGNUP = 'sign-up';
  static const HOME = 'home';
  static const SINGLEPRODUCT = 'singel-product';
  static const CART = 'cart';
  static const ORDER = 'order';
  static const SINGLEORDER = 'single-order';
  static const NOTIFICATION = 'notification';
}

final appRoutes = {
  AppRoutes.INTIAL: (context) => BlocProvider<OnboardingCubit>(
        create: (context) => OnboardingCubit(),
        lazy: false,
        child: const OnBoardingView(),
      ),
  AppRoutes.SPLASH: (context) => const SplashView(),
  AppRoutes.SIGNIN: (context) => BlocProvider<SigninCubit>(
        create: (context) => SigninCubit(),
        child: const SignInView(),
      ),
  AppRoutes.HOME: (context) => const HomeView(),
  AppRoutes.SIGNUP: (context) => BlocProvider<SignUpCubit>(
        create: (context) => SignUpCubit(),
        child: const SignUpView(),
      ),
  AppRoutes.SINGLEPRODUCT: (context) => const SingleProductView(),
  AppRoutes.CART: (context) => const CartView(),
  AppRoutes.ORDER: (context) => const OrderView(),
  AppRoutes.SINGLEORDER: (context) => const SingleOrderView(),
  AppRoutes.NOTIFICATION: (context) => const NotificationScreen(),
};

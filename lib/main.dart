import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
          BlocProvider<CartCubit>(create: (context) => CartCubit()),
        ],
        child: MaterialApp(
          title: 'Flutter E-Commerce',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          navigatorKey: navKey,
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          routes: appRoutes,
        ),
      ),
    );
  }
}

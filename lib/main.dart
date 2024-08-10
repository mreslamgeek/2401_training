import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/global/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter_application_1/global/services/notification.dart';
import 'package:flutter_application_1/modules/home/home_cubit.dart';
import 'package:flutter_application_1/modules/order/cubit/order_cubit.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService notificationService =
      NotificationService(FirebaseMessaging.instance, FlutterLocalNotificationsPlugin());

  notificationService.initNotifications(
    fcmCreationCallback: (fcm) {
      FirebaseMessaging.instance.subscribeToTopic('all');
    },
  );
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
          BlocProvider<OrderCubit>(create: (context) => OrderCubit()),
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

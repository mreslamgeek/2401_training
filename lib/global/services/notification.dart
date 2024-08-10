import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/utils/ext.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

typedef FCMCallback = void Function(String? fcm)?;

///it cant be a class method funcation
///it must be top level function
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  message.notification?.title
      .printLog(bgColor: ANSICOLOR.yellow, color: ANSICOLOR.black, name: "Notification Title");
  message.notification?.body
      .printLog(bgColor: ANSICOLOR.yellow, color: ANSICOLOR.black, name: "Notification Body");
  message.data.printLog(bgColor: ANSICOLOR.yellow, color: ANSICOLOR.black, name: "Payload");
}

final Dio _dio = Dio();

Future<Uint8List> _getImageBytes(String imageUrl) async {
  Response<List<int>> response = await _dio.get<List<int>>(
    imageUrl,
    options: Options(responseType: ResponseType.bytes),
  );
  return Uint8List.fromList(response.data!);
}

const _androidChannel = AndroidNotificationChannel(
  'fb_demo_channel',
  'FB Demo Channel',
  description: 'FB Demo Important Notification Channel',
  playSound: true,
  enableVibration: true,
  importance: Importance.max,
  enableLights: true,
  ledColor: Colors.red,
  showBadge: true,
);

class NotificationService {
  NotificationService(this._firebaseMessaging, this._localnotifications);

  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localnotifications;

  void _handleMessage(RemoteMessage? message) {
    if (message == null) return;
    // Get.offNamedUntil(Routes.SINGLE_NOTIFICATION, ModalRoute.withName(Routes.SINGLE_NOTIFICATION),
    //     arguments: message);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration.zero);

      // navigate here

      navKey.currentState?.pushNamed(AppRoutes.NOTIFICATION, arguments: message);
    });
  }

  Future<void> _handleForeground(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    message.data.printLog(name: "message Payload");
    message.from.printLog(name: "message From");

    final img = notification?.android?.imageUrl;
    final icon = notification?.android?.smallIcon;
    img.printLog(name: "android notification imageUrl");
    icon.printLog(name: "android notification smallIcon");

    message.notification?.android?.link.printLog(name: "android notification link");
    // message.notification?.android?.imageUrl.printLog();
    if (notification == null) return;

    var notificationTitle = notification.title.toString();
    var notificationBody = notification.body.toString();
    notificationTitle.printLog(name: "notification Title");
    notificationBody.printLog(name: "notification Body");

    _localnotifications.show(
      notification.hashCode,
      notificationTitle,
      notificationBody,
      await _notificationDetails(image: img ?? icon ?? message.data["image"]),
      payload: jsonEncode(message.toMap()),
    );
  }

  Future<void> initNotifications({FCMCallback fcmCreationCallback}) async {
    try {
      String? fcmTokken;
      final notificationSettings = await _firebaseMessaging.requestPermission();

      if (notificationSettings.authorizationStatus != AuthorizationStatus.authorized) return;

      fcmTokken = await _firebaseMessaging.getToken();

      fcmTokken.printLog(bgColor: ANSICOLOR.yellow, color: ANSICOLOR.black, name: "FCM Tokken");

      _initPushNotifications();

      _initLocalNotification();

      if (fcmCreationCallback != null) fcmCreationCallback(fcmTokken);
    } catch (e, stack) {
      e.printLog(color: ANSICOLOR.red, name: 'initNotifications error');
      stack.printLog(color: ANSICOLOR.red, name: 'initNotifications stack');
    }
  }

  Future<void> _initPushNotifications() async {
    //for ios foregound notification
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    /// this responsile for perform an action
    /// if app is opend from terminated state via an notification
    FirebaseMessaging.instance.getInitialMessage().then(_handleMessage);

    /// if app is opend from backdound state via an notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // handle background and terminated state
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    // handle notifications messaage when application is in foreground state
    FirebaseMessaging.onMessage.listen(_handleForeground);
  }

  Future<NotificationDetails> _notificationDetails({String? image}) async => NotificationDetails(
        iOS: const DarwinNotificationDetails(),
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          playSound: _androidChannel.playSound,
          enableVibration: _androidChannel.enableVibration,
          importance: _androidChannel.importance,
          priority: Priority.high,
          icon: '@drawable/ic_launcher',
          styleInformation: image == null
              ? null
              : BigPictureStyleInformation(
                  ByteArrayAndroidBitmap.fromBase64String(
                      base64Encode(await _getImageBytes(image))),
                  largeIcon: ByteArrayAndroidBitmap.fromBase64String(base64Encode(image.codeUnits)),
                ),
        ),
      );

  Future _initLocalNotification() async {
    const iosInitialize = DarwinInitializationSettings();
    const androidInitialize = AndroidInitializationSettings('@drawable/ic_launcher');
    const initializeSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    await _localnotifications.initialize(
      initializeSettings,
      onDidReceiveNotificationResponse: (payload) {
        //when user triggers notification with local notificaiton
        final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
        _handleMessage(message);
      },
    );

    if (Platform.isAndroid) {
      await _localnotifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_androidChannel);
    }

    if (Platform.isIOS) {
      await _localnotifications
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
    // /*  final platformAndroid =  */

    // await localnotifications
    //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(_androidChannel);
    // final platformIOS = localnotifications
    // .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
    // await platformAndroid?.createNotificationChannel(_androidChannel);
  }
}

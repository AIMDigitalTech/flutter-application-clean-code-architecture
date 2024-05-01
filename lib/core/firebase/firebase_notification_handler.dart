import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications',
  importance: Importance.high,
);

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initFirebaseApp() async {
  //request permission for notification from user
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  final fCMToken = await FirebaseMessaging.instance.getToken();

  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
          requestAlertPermission: true,
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
    selectNotification(response.payload);
  });

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

  debugPrint('FCM Token: $fCMToken');

  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
    // Get the current user's ID
  }).onError((err) {
    debugPrint('Error refreshing token: $err');
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification? notification = message.notification;

    AndroidNotification? android = message.notification?.android;
    //test why needed
    // selectNotification(jsonEncode(message.data), message.data['post_id']);

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              '00000',
              'GPS Tracker',
              importance: Importance.max,
              visibility: NotificationVisibility.public,
              channelAction: AndroidNotificationChannelAction.createIfNotExists,
            ),
          ),
          payload: jsonEncode(message.data) // Set the payload here
          );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    debugPrint('Message data: ${message.data}');
  });
}

// This function will be called when the user taps on the notification
Future selectNotification(String? payload) async {
  if (payload != null) {}
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  // display a dialog with the notification details, tap ok to go to another page
}

void showNotification(String title, String body) {
  const androidNotificationDetail = AndroidNotificationDetails(
      '0', // channel Id
      'general' // channel Name
      );
  const iosNotificatonDetail = DarwinNotificationDetails();
  const notificationDetails = NotificationDetails(
    iOS: iosNotificatonDetail,
    android: androidNotificationDetail,
  );
  flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
}

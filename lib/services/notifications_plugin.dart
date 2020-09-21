import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPlugin {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initializationSettings;
  NotificationPlugin() {
    init();
  }

  init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestIOSPermission();
    }
    initializePlatformSepcifics();
  }

  _requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(alert: false, badge: true, sound: true);
  }

  initializePlatformSepcifics() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('notifi_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
  }

  setOnNotificationClick() async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    var androidChannelSpecifics = AndroidNotificationDetails(
        'Channel_ID', 'Channel_NAME', 'Channel_DESCRIPTION',
        importance: Importance.Max,
        priority: Priority.High,
        playSound: true,
        timeoutAfter: 5000,
        styleInformation: DefaultStyleInformation(true, true));
    var iosChannelSprcifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSprcifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'Test title', 'Test body', platformChannelSpecifics,
        payload: 'New Payload');
  }

  Future<void> morningNotification(String name) async {
    var time = Time(3, 00, 00);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_MORNING_$name',
      'CHANNEL_MORNING_$name',
      "CHANNEL_DESCRIPTION_MORNING_$name",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body_$name', //null
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<void> afternoonNotification(String name) async {
    var time = Time(14, 0, 0);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_AFTERNOON_$name',
      'CHANNEL_AFTERNOON_$name',
      "CHANNEL_DESCRIPTION_AFTERNOON_$name",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body_$name', //null
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<void> eveningNotification(String name) async {
    var time = Time(19, 0, 0);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_EVENING_$name',
      'CHANNEL_NAME_EVENING_$name',
      "CHANNEL_DESCRIPTION_EVENING_$name",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body_$name', //null
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<void> nightNotification(String name) async {
    var time = Time(22, 0, 0);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_NIGHT_$name',
      'CHANNEL_NAME_NIGHT_$name',
      "CHANNEL_DESCRIPTION_NIGHT_$name",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body_$name', //null
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<int> getPendingNotificationCount() async {
    List<PendingNotificationRequest> p =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return p.length;
  }
}

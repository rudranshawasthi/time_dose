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

  Future<void> morningNotification(String name, int id) async {
    var time = Time(18, 25, 00);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_MORNING',
      'CHANNEL_MORNING',
      "CHANNEL_DESCRIPTION_MORNING",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body_$name Morning', //null
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<void> afternoonNotification(String name, int id) async {
    var time = Time(18, 26, 00);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_AFTERNOON',
      'CHANNEL_AFTERNOON',
      "CHANNEL_DESCRIPTION_AFTERNOON",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body_$name afternoon', //null
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<void> eveningNotification(String name, int id) async {
    var time = Time(18, 27, 00);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_EVENING',
      'CHANNEL_NAME_EVENING',
      "CHANNEL_DESCRIPTION_EVENING",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
      'Test Title at ${time.hour}:${time.minute}.${time.second}',
      'Test Body_$name evening', //null
      time,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }

  Future<void> nightNotification(String name, int id) async {
    var time = Time(18, 28, 0);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID_NIGHT',
      'CHANNEL_NAME_NIGHT',
      "CHANNEL_DESCRIPTION_NIGHT",
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
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

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

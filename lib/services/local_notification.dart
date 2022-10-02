import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  LocalNotification() {
    var androidInitilize = AndroidInitializationSettings('ic_launcher');
    var iOSInitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSInitilize);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initilizationsSettings);
  }

  Future showSwitchOffNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId", "channelName",channelDescription: "channelDescription",
        importance: Importance.max);
    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await flutterLocalNotificationsPlugin.show(0, "Biomatrics is off",
        "Local Authentication", generalNotificationDetails);
  }

  Future showSwitchOnNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId", "channelName", channelDescription : "channelDescription",
        importance: Importance.max);
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(0, "Biomatrics is on",
        "Local Authentication", generalNotificationDetails);
  }
}

import 'package:flutter_app/api_calling_class/chopper_class.dart';
import 'package:flutter_app/models/goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/goshthi_report_request_model.dart';
import 'package:flutter_app/models/load_notifications_request_model.dart';
import 'package:flutter_app/models/networking_report_request_model.dart';
import 'package:flutter_app/models/read_notification_request_model.dart';
import 'package:flutter_app/models/report_request_model.dart';
import 'package:flutter_app/models/sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/sabha_report_questions_request_model.dart';
import 'package:flutter_app/models/sabha_sabha_report_attendance_request_model.dart';
import 'package:flutter_app/models/submit_goshthi_report_attendance_request_model.dart';
import 'package:flutter_app/models/submit_sabha_report_request_model.dart';
import 'package:flutter_app/models/update_goshthi_held_status_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class INotificationService {
  Future<dynamic> loadNotifications(LoadNotificationsRequestModel loadNotificationsRequestModel, accessToken, context);
  Future<dynamic> readNotification(ReadNotificationRequestModel readNotificationRequestModel, accessToken, context);
}

@Singleton(as: INotificationService)
class NotificationService implements INotificationService {
  CommonChopperClass commonChopperClass = CommonChopperClass();

  @override
  Future<dynamic> loadNotifications(loadNotificationsRequestModel, accessToken, context) async {
    return await commonChopperClass.loadNotifications(loadNotificationsRequestModel, accessToken, context);
  }

  @override
  Future<dynamic> readNotification(readNotificationRequestModel, accessToken, context) async {
    return await commonChopperClass.readNotification(readNotificationRequestModel, accessToken, context);
  }
}
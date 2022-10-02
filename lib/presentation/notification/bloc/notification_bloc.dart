import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/load_notifications_request_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/notification_model.dart';
import 'package:flutter_app/models/read_notification_model.dart';
import 'package:flutter_app/models/read_notification_request_model.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../preferences.dart';
import '../../../utils/login_status.dart';

part 'notification_bloc.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.loadNotifications(NotificationModel? notificationModel, LoadingStatus loadingStatus) =
      _NotificationStateLoadNotification;
  const factory NotificationState.loading() = _NotificationStateLoading;
  const factory NotificationState.error(LoadingStatus loadingStatus) = _NotificationStateError;
  const factory NotificationState.readNotification(
          LoadingStatus loadingStatus, ReadNotificationModel? readNotificationModel) =
      _NotificationStateReaadNotificationModel;
}

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadNotifications(
    BuildContext context,
  ) = _loadNotifications;

  const factory NotificationEvent.readNotification(
      BuildContext context, ReadNotificationRequestModel readNotificationRequestModel) = _readNotification;
}

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  INotificationService _iNotificationService;

  NotificationBloc(this._iNotificationService)
      : super(NotificationState.loadNotifications(
            NotificationModel.fromJson(Map<String, String>()), LoadingStatus.Initialized)) {
    on<NotificationEvent>((event, emit) async {
      await event.when(loadNotifications: (context) async {
        final _pref = await Preferences.getInstance();
        LoginModel? loginModel = await _pref.getToken();
        emit(NotificationState.loading());
        var loadNotificationsRequestModel = LoadNotificationsRequestModel(
          Utils().nullSafeString(loginModel!.login_user_type.toString()),
          Utils().nullSafeString(loginModel.login_parent_type),
          Utils().nullSafeString(loginModel.role),
          Utils().nullSafeInt(loginModel.bkms_id).toString(),
        );
        final val = await _iNotificationService.loadNotifications(
            loadNotificationsRequestModel, Utils().nullSafeString(loginModel.access_token), context);
        if (val != null) {
          emit(
            NotificationState.loadNotifications(val, LoadingStatus.Done),
          );
        } else {
          emit(
            NotificationState.loadNotifications(val, LoadingStatus.Error),
          );
        }
      }, readNotification: (context, readNotificationRequestModel) async {
        emit(NotificationState.loading());
        final _pref = await Preferences.getInstance();
        LoginModel? loginModel = await _pref.getToken();
        final val = await _iNotificationService.readNotification(
            readNotificationRequestModel, Utils().nullSafeString(loginModel!.access_token), context);
        if (val != null) {
          emit(NotificationState.readNotification(LoadingStatus.Done, val));
        } else {
          emit(NotificationState.error(LoadingStatus.Error));
        }
      });
    });
  }

  // @override
  // Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
  //
  // }
}

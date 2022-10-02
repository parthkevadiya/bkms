import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/add_new_record_model.dart';
import 'package:flutter_app/models/add_new_record_request_model.dart';
import 'package:flutter_app/models/deactivate_user_model.dart';
import 'package:flutter_app/models/deactivate_user_request_model.dart';
import 'package:flutter_app/models/event_detail.dart';
import 'package:flutter_app/models/event_detail_request.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/update_profile_model.dart';
import 'package:flutter_app/models/update_profile_request_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/models/user_profile_request_model.dart';
import 'package:flutter_app/preferences.dart';
import 'package:flutter_app/services/user_profile_service.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_profile_bloc.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.load(UserProfileModel? userProfileModel) = _UserProfileState;
  const factory UserProfileState.loading() = _UserProfileLoadingState;
  const factory UserProfileState.empty() = _UserProfileEmptyState;
}

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.load(UpdateProfileModel? updateProfileModel) = _UpdateProfileState;
  const factory UpdateProfileState.empty() = _UpdateEmptyState;
  const factory UpdateProfileState.loading() = _UpdateLoadingState;
}

@freezed
class AddNewRecordState with _$AddNewRecordState {
  const factory AddNewRecordState.load(AddNewRecordModel? addNewRecordModel, LoadingStatus loadingStatus) =
      _AddNewRecordState;
  const factory AddNewRecordState.userWiseGroup(UserWiseGroup? userWiseGroup, LoadingStatus loadingStatus) =
      _UserWiseGroupState;
  const factory AddNewRecordState.empty(LoadingStatus loadingStatus) = _EmptyState;
}

@freezed
class DeactivateUserState with _$DeactivateUserState {
  const factory DeactivateUserState.deactivate(DeactivateUserModel? deactivateUserModel) =
      _DeactivateUserDeactivateState;
  const factory DeactivateUserState.loading() = _DeactivateUserLoadingState;
  const factory DeactivateUserState.empty() = _DeactivateUserEmptyState;
}

@freezed
class EventDetailState with _$EventDetailState {
  const factory EventDetailState.load(EventDetailModel? eventDetailModel, LoadingStatus loadingStatus) =
      _EventDetailState;
  const factory EventDetailState.empty(LoadingStatus loadingStatus) = _EventEmptyState;
}

@freezed
class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.load(BuildContext context, String strRecordId) = _load;

  const factory UserProfileEvent.edit(UserProfileModel userProfileModel) = _edit;
}

@freezed
class UpdateProfileEvent with _$UpdateProfileEvent {
  const factory UpdateProfileEvent.updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel, String token, BuildContext context) = _updateProfile;
}

@freezed
class AddNewRecordEvent with _$AddNewRecordEvent {
  const factory AddNewRecordEvent.addNewRecord(
      AddNewRecordRequestModel addNewRecordRequestModel, String token, BuildContext context) = _addNewRecord;
  const factory AddNewRecordEvent.userWiseGroup(
      UserWiseGroupRequest userWiseGroupRequest, String token, BuildContext context) = _userWiseGroupEvent;
}

@freezed
class DeactivateUserEvent with _$DeactivateUserEvent {
  const factory DeactivateUserEvent.deactivateUser(
      DeactivateUserRequestModel deactivateUserRequestModel, String token, BuildContext context) = _deactivateUser;
}

@freezed
class EventDetailEvent with _$EventDetailEvent {
  const factory EventDetailEvent.eventDetail(int? eventId, BuildContext context) = _EventDetail;
}

@Singleton()
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  IUserProfileService _userProfileService;

  UserProfileBloc(
    this._userProfileService,
  ) : super(UserProfileState.loading()) {
    on<UserProfileEvent>((event, emit) async {
      await event.when(
        edit: (userProfileModel) async {
          await _userProfileService.edit(userProfileModel);
          // emit(state.copyWith(
          //     userProfileModel: await _userProfileService.userProfileModel));
          emit(UserProfileState.load(_userProfileService.userProfileModel));
        },
        load: (context, strRecordId) async {
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          emit(UserProfileState.loading());
          var userProfileRequestModel = UserProfileRequestModel(
              Utils().nullSafeString(loginModel!.login_user_type.toString()),
              Utils().nullSafeString(loginModel.login_parent_type),
              Utils().nullSafeInt(loginModel.bkms_id).toString(),
              strRecordId);

          final val = await _userProfileService.load(
              userProfileRequestModel, Utils().nullSafeString(loginModel.access_token), context);
          if (val != null) {
            emit(UserProfileState.load(val));
          } else {
            emit(UserProfileState.empty());
          }
        },
      );
    });
  }
}

@Singleton()
class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  IUserProfileService _userProfileService;

  UpdateProfileBloc(
    this._userProfileService,
  ) : super(UpdateProfileState.load(null)) {
    on<UpdateProfileEvent>((event, emit) async {
      await event.when(
        updateProfile: (updateProfileRequestModel, token, context) async {
          emit(UpdateProfileState.loading());
          final val = await _userProfileService.updateProfile(updateProfileRequestModel, token, context);
          if (val != null) {
            emit(
              UpdateProfileState.load(val),
            );
          } else {
            emit(UpdateProfileState.empty());
          }
        },
      );
    });
  }
}

@Singleton()
class AddNewRecordBloc extends Bloc<AddNewRecordEvent, AddNewRecordState> {
  IUserProfileService _userProfileService;

  AddNewRecordBloc(
    this._userProfileService,
  ) : super(const AddNewRecordState.empty(LoadingStatus.Initialized)) {
    on<AddNewRecordEvent>((event, emit) async {
      await event.when(
        addNewRecord: (addNewRecordRequestModel, token, context) async {
          AddNewRecordModel? addNewRecordModel =
              await _userProfileService.addNewRecord(addNewRecordRequestModel, token, context);
          if (addNewRecordModel != null) {
            emit(AddNewRecordState.load(addNewRecordModel, LoadingStatus.Done));
          } else {
            emit(AddNewRecordState.empty(LoadingStatus.Error));
          }
        },
        userWiseGroup: (userWiseGroupRequest, token, context) async {
          emit(AddNewRecordState.empty(LoadingStatus.InProgress));
          UserWiseGroup? userWiseGroup = await _userProfileService.userWiseGroup(userWiseGroupRequest, token, context);
          if (userWiseGroup != null) {
            emit(
              AddNewRecordState.userWiseGroup(userWiseGroup, LoadingStatus.Done),
            );
          } else {
            emit(AddNewRecordState.empty(LoadingStatus.Error));
          }
        },
      );
    });
  }
}

@Singleton()
class DeactivateUserBloc extends Bloc<DeactivateUserEvent, DeactivateUserState> {
  IUserProfileService _userProfileService;

  DeactivateUserBloc(
    this._userProfileService,
  ) : super(DeactivateUserState.deactivate(null)) {
    on<DeactivateUserEvent>((event, emit) async {
      await event.when(
        deactivateUser: (deactivateUserRequestModel, token, context) async {
          emit(DeactivateUserState.loading());

          final val = await _userProfileService.deactivateUser(deactivateUserRequestModel, token, context);
          if (val != null) {
            emit(
              DeactivateUserState.deactivate(val),
            );
          } else {
            emit(
              DeactivateUserState.empty(),
            );
          }
        },
      );
    });
  }
}

@Singleton()
class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  IUserProfileService _userProfileService;

  EventDetailBloc(
    this._userProfileService,
  ) : super(const EventDetailState.empty(LoadingStatus.Initialized)) {
    on<EventDetailEvent>((event, emit) async {
      await event.when(
        eventDetail: (eventId, context) async {
          emit(EventDetailState.empty(LoadingStatus.InProgress));
          final _pref = await Preferences.getInstance();
          LoginModel? loginModel = await _pref.getToken();
          var eventDetailRequestModel = EventDetailRequestModel(loginModel!.bkms_id.toString(), eventId.toString());
          EventDetailModel eventDetailModel =
              await _userProfileService.eventDetail(eventDetailRequestModel, loginModel.access_token, context);
          if (eventDetailModel != null) {
            emit(EventDetailState.load(eventDetailModel, LoadingStatus.Done));
          } else {
            emit(EventDetailState.empty(LoadingStatus.Error));
          }
        },
      );
    });
  }
}

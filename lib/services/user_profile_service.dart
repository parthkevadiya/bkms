import 'package:flutter_app/api_calling_class/chopper_class.dart';
import 'package:flutter_app/models/add_new_record_request_model.dart';
import 'package:flutter_app/models/deactivate_user_request_model.dart';
import 'package:flutter_app/models/event_detail_request.dart';
import 'package:flutter_app/models/update_profile_request_model.dart';
import 'package:flutter_app/models/user_profile_model.dart';
import 'package:flutter_app/models/user_profile_request_model.dart';

import 'package:injectable/injectable.dart';

abstract class IUserProfileService {
  UserProfileModel get userProfileModel;

  Future<void> edit(UserProfileModel userProfileModel);
  Future<dynamic> load(UserProfileRequestModel userProfileRequestModel, token, context);
  Future<dynamic> updateProfile(UpdateProfileRequestModel updateProfileRequestModel, token, context);
  Future<dynamic> addNewRecord(AddNewRecordRequestModel addNewRecordRequestModel, token, context);
  Future<dynamic> userWiseGroup(UserWiseGroupRequest userWiseGroupRequest, token, context);
  Future<dynamic> deactivateUser(DeactivateUserRequestModel deactivateUserRequestModel, token, context);
  Future<dynamic> eventDetail(EventDetailRequestModel eventDetailRequestModel, token, context);
}

@Singleton(as: IUserProfileService)
class UserProfileService implements IUserProfileService {
  CommonChopperClass commonChopperClass = CommonChopperClass();

  @override
  Future<dynamic> load(userProfileRequestModel, token, context) async {
    return await commonChopperClass.userProfile(userProfileRequestModel, token, context);
  }

  @override
  Future<dynamic> updateProfile(updateProfileRequestModel, token, context) async {
    return await commonChopperClass.updateProfile(updateProfileRequestModel, token, context);
  }

  @override
  Future<dynamic> addNewRecord(addNewRecordRequestModel, token, context) async {
    return await commonChopperClass.addNewRecord(addNewRecordRequestModel, token, context);
  }

  @override
  Future<dynamic> deactivateUser(deactivateUserRequestModel, token, context) async {
    return await commonChopperClass.deactivateUser(deactivateUserRequestModel, token, context);
  }

  @override
  Future<dynamic> eventDetail(eventDetailRequestModel, token, context) async {
    return await commonChopperClass.eventDetail(eventDetailRequestModel, token, context);
  }

  late UserProfileModel _userProfileModel;

  @override
  UserProfileModel get userProfileModel => this._userProfileModel;

  @override
  Future<void> edit(UserProfileModel userProfileModel) async {
    _userProfileModel = userProfileModel;
  }

  @override
  Future userWiseGroup(userWiseGroupRequest, token, context) async {
    return await commonChopperClass.userWiseGroup(userWiseGroupRequest, token, context);
  }
}

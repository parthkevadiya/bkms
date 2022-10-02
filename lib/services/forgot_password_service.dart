import 'package:flutter_app/api_calling_class/chopper_class.dart';
import 'package:flutter_app/models/forgot_password_model.dart';
import 'package:flutter_app/models/forgot_password_request_model.dart';

import 'package:injectable/injectable.dart';

abstract class IForgotPasswordService {
  Future<ForgotPasswordModel> load(ForgotPasswordRequestModel forgotPasswordRequestModel);
}

@Singleton(as: IForgotPasswordService)
class ForgotPasswordService implements IForgotPasswordService {
  CommonChopperClass commonChopperClass = CommonChopperClass();

  @override
  Future<ForgotPasswordModel> load(forgotPasswordRequestModel) async {
    return await commonChopperClass.forgotPassword(forgotPasswordRequestModel);
  }
}

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_app/api_calling_class/chopper_class.dart';
// import 'package:flutter_app/models/forgot_password_model.dart';
// import 'package:flutter_app/models/forgot_password_request_model.dart';
// import 'package:flutter_app/models/login_model.dart';
// import 'package:flutter_app/models/login_request_model.dart';
// import 'package:flutter_app/models/reset_password_model.dart';
// import 'package:flutter_app/models/reset_password_request_model.dart';
// import 'package:flutter_app/models/standardResponse.dart';
// import 'package:flutter_app/utils/constant.dart';
// import 'package:flutter_app/utils/util.dart';
// import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../preferences.dart';
//
// abstract class IAuthService {
//   bool get isLoggedIn;
//
//   int get responseCode;
//
//   int get responseCodeResetPassword;
//
//   String get message;
//
//   bool get bio;
//
//   Future<void> login(LoginRequestModel loginRequestModel, BuildContext context);
//
//   Future<void> forgotPassword(
//       ForgotPasswordRequestModel forgotPasswordRequestModel);
//
//   Future<void> resetPassword(
//       ResetPasswordRequestModel resetPasswordRequestModel);
//
//   Future<void> logOut();
//
//   Future<void> check();
//
//   Future<void> setbiomatric(String biomatri);
//
//   Future<void> getbiomatric();
// }
//
// @Singleton(as: IAuthService)
// class AuthService implements IAuthService {
//   bool _isLoggedIn = false;
//   int _responseCode = 0;
//   int _responseCodeResetPassword = 0;
//   String _message = '';
//   bool _bio = false;
//
//   @override
//   bool get isLoggedIn => _isLoggedIn;
//
//   @override
//   int get responseCode => _responseCode;
//
//   @override
//   int get responseCodeResetPassword => _responseCodeResetPassword;
//
//   @override
//   String get message => _message;
//
//   @override
//   bool get bio => _bio;
//
//   @override
//   Future<void> logOut() async {
//     /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.clear();*/
//     final _pref = await Preferences.getInstance();
//     await _pref.removeUserPreferences();
//     _isLoggedIn = false;
//   }
//
//   @override
//   Future<void> login(LoginRequestModel loginRequestModel, BuildContext context) async {
//     CommonChopperClass commonChopperClass = CommonChopperClass();
//     var loginModel = await commonChopperClass.getLogin(loginRequestModel, context);
//
//     if(loginModel != null && loginModel is LoginModel){
//       _responseCode = 200;
//       _isLoggedIn = _responseCode == 200;
//       _message = '';
//
//       /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//       sharedPreferences.setString(Constant.spACCESS_TOKEN, Utils().nullSafeString(loginModel.access_token));
//       sharedPreferences.setString(Constant.spLOGIN_MODEL_CLASS, loginModel.toJson().toString());*/
//       final _pref = await Preferences.getInstance();
//       await _pref.setToken(loginModel);
//     }else{
//       _responseCode = 400;
//       _message = Utils().nullSafeString("");
//     }
//
//     // return loginModel;
//   }
//
//   @override
//   Future<void> forgotPassword(forgotPasswordRequestModel) async {
//     CommonChopperClass commonChopperClass = CommonChopperClass();
//     var forgotPasswordModel = await commonChopperClass.forgotPassword(forgotPasswordRequestModel);
//
//     if(forgotPasswordModel is ForgotPasswordModel) {
//       _responseCode = 200;
//       _message = '';
//     }else{
//       _responseCode = 400;
//       _message = Utils().nullSafeString(forgotPasswordModel);
//     }
//   }
//
//   @override
//   Future<void> resetPassword(resetPasswordRequestModel) async {
//     CommonChopperClass commonChopperClass = CommonChopperClass();
//     var resetPasswordModel = await commonChopperClass.resetPassword(resetPasswordRequestModel);
//
//     if(resetPasswordModel is ResetPasswordModel) {
//       _responseCodeResetPassword = 200;
//       _message = '';
//     }else{
//       _responseCode = 400;
//       _message = Utils().nullSafeString(resetPasswordModel);
//     }
//   }
//
//   @override
//   Future<void> check() async {
//     /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? fetchToken = sharedPreferences.getString(Constant.spACCESS_TOKEN);
//     (fetchToken != null) ? _isLoggedIn = true : _isLoggedIn = false;*/
//
//     final _pref = await Preferences.getInstance();
//     try {
//       LoginModel? loginModel = await _pref.getToken();
//
//       if (loginModel != null && loginModel.access_token != "") {
//         print('token confirmed');
//         _isLoggedIn = true;
//       } else {
//         print('token not found');
//         _isLoggedIn = false;
//       }
//     } catch (e) {
//       _isLoggedIn = false;
//     }
//   }
//
//   @override
//   Future<void> setbiomatric(String biomatri) async {
//     /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setString("biotrue", biomatri);*/
//     final _pref = await Preferences.getInstance();
//     await _pref.setBioMatric(biomatri);
//     _bio = biomatri == "true" ? true : false;
//   }
//
//   @override
//   Future<void> getbiomatric() async {
//     /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? bio = sharedPreferences.getString("biotrue");*/
//     final _pref = await Preferences.getInstance();
//     String bio = await _pref.getBioMatric();
//     _bio = bio == "true" ? true : false;
//     // (bio == "true") ? LocalAuthApi.authenticate() : "";
//   }
// }

import 'package:flutter_app/api_calling_class/chopper_class.dart';
import 'package:flutter_app/models/forgot_password_model.dart';
import 'package:flutter_app/models/forgot_password_request_model.dart';
import 'package:flutter_app/models/login_model.dart';
import 'package:flutter_app/models/login_request_model.dart';
import 'package:flutter_app/models/refresh_token_model.dart';
import 'package:flutter_app/models/refresh_token_request_model.dart';
import 'package:flutter_app/models/reset_password_model.dart';
import 'package:flutter_app/models/reset_password_request_model.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:injectable/injectable.dart';

import '../preferences.dart';

abstract class IAuthService {
  bool get isSuccess;

  int get responseCode;

  String get message;

  Future<bool> login(LoginRequestModel loginRequestModel);

  Future<void> forgotPassword(ForgotPasswordRequestModel forgotPasswordRequestModel);

  Future<bool> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel);

  Future<void> logOut();

  Future<void> check();
}

@Singleton(as: IAuthService)
class AuthService implements IAuthService {
  bool _isSuccess = false;
  int _responseCode = 0;
  String _message = '';

  @override
  bool get isSuccess => _isSuccess;

  @override
  int get responseCode => _responseCode;

  @override
  String get message => _message;

  @override
  Future<void> logOut() async {
    final _pref = await Preferences.getInstance();
    await _pref.removeUserPreferences();
    _isSuccess = false;
  }

  @override
  Future<bool> login(LoginRequestModel loginRequestModel) async {
    CommonChopperClass commonChopperClass = CommonChopperClass();
    var loginModel = await commonChopperClass.getLogin(loginRequestModel);

    if (loginModel is LoginModel) {
      _responseCode = 200;
      _isSuccess = _responseCode == 200;

      final _pref = await Preferences.getInstance();
      await _pref.setToken(loginModel);
      return true;
    } else {
      _responseCode = 400;
      _message = Utils().nullSafeString(loginModel);
      return false;
    }
  }

  @override
  Future<void> forgotPassword(forgotPasswordRequestModel) async {
    CommonChopperClass commonChopperClass = CommonChopperClass();
    var forgotPasswordModel = await commonChopperClass.forgotPassword(forgotPasswordRequestModel);
    if (forgotPasswordModel is ForgotPasswordModel) {
      _responseCode = 200;
      _isSuccess = _responseCode == 200;
      _message = "";
    } else {
      _responseCode = 400;
      _message = Utils().nullSafeString(forgotPasswordModel);
    }
  }

  @override
  Future<bool> resetPassword(resetPasswordRequestModel) async {
    CommonChopperClass commonChopperClass = CommonChopperClass();
    var resetPasswordModel = await commonChopperClass.resetPassword(resetPasswordRequestModel);

    if (resetPasswordModel is ResetPasswordModel) {
      _responseCode = 200;
      _isSuccess = _responseCode == 200;
      _message = '';
      return true;
    } else {
      _responseCode = 400;
      _message = Utils().nullSafeString(resetPasswordModel);
      return false;
    }
  }

  @override
  Future<void> check() async {
    final _pref = await Preferences.getInstance();
    try {
      LoginModel? loginModel = await _pref.getToken();

      if (loginModel != null && loginModel.access_token != "") {
        print('token confirmed');
        _isSuccess = true;
      } else {
        print('token not found');
        _isSuccess = false;
      }
    } catch (e) {
      _isSuccess = false;
    }
  }
}

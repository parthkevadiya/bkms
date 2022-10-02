import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/forgot_password_request_model.dart';
import 'package:flutter_app/models/login_request_model.dart';
import 'package:flutter_app/models/remote_config.dart';
import 'package:flutter_app/models/reset_password_request_model.dart';
import 'package:flutter_app/services/setting_service.dart';
import 'package:flutter_app/utils/login_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import '../../services/auth_service.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading(LoadingStatus loadingStatus) = _AutStateLoading;
  const factory AuthState.fetchRemoteConfigNull(LoadingStatus loadingStatus) = _fetchRemoteConfigNullState;
  const factory AuthState.fetchRemoteConfig(LoadingStatus loadingStatus, RemoteConfigModel remoteConfigModel) =
      _fetchRemoteConfigState;

  const factory AuthState.load(LoadingStatus loadingStatus, bool isLoggedIn) = _AuthStateLoad;

  const factory AuthState.loginSuccess(LoadingStatus loadingStatus, bool isLoggedIn) = _AuthStateLoginSuccess;

  const factory AuthState.forgetPasswordSuccess(LoadingStatus loadingStatus, bool isSuccess) =
      _AuthStateForgetPasswordSuccess;

  const factory AuthState.resetPasswordSuccess(LoadingStatus loadingStatus, bool isSuccess) =
      _AuthStateResetPasswordSuccess;
  const factory AuthState.hasBio(LoadingStatus loadingStatus, bool isAvailableBio) = _AuthHasBioState;

  const factory AuthState.error(LoadingStatus loadingStatus, String errorMessage) = _AuthStateError;

// const factory AuthState(bool isLoggedIn, int responseCode, bool bio, int responseCodeResetPassword, String message) = _AuthState;
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.load() = _Load;
  const factory AuthEvent.hasBio() = _HasBio;

  const factory AuthEvent.logIn(LoginRequestModel loginRequestModel) = _LogIn;

  const factory AuthEvent.forgotPassword(ForgotPasswordRequestModel forgotPasswordRequestModel) = _ForgotPassword;

  const factory AuthEvent.resetPassword(ResetPasswordRequestModel resetPasswordRequestModel) = _ResetPassword;
  const factory AuthEvent.fetchRemoteConfig() = _FetchRemoteConfig;

  const factory AuthEvent.logOut() = _LogOut;
}

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  IAuthService _authService;
  FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  RemoteConfigModel? remoteConfigModel;
  ISettingService _settingService;
  final _auth = LocalAuthentication();
  Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  Future<void> _initConfig() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1), // a fetch will wait up to 10 seconds before timing out
      minimumFetchInterval: const Duration(seconds: 10), // fetch parameters will be cached for a maximum of 1 hour
    ));

    await _fetchConfig();
  }

  // Fetching, caching, and activating remote config
  Future<void> _fetchConfig() async {
    await _remoteConfig.fetchAndActivate();
  }

  AuthBloc(this._authService, this._settingService) : super(AuthState.load(LoadingStatus.Initialized, false)) {
    on<AuthEvent>((event, emit) async {
      await event.when(load: () async {
        emit(AuthState.loading(LoadingStatus.InProgress));
        await _settingService.getbiomatric();
        try {
          await _initConfig();
          var config = await _remoteConfig.getAll();
          remoteConfigModel = RemoteConfigModel.fromConfig(config);
          if (remoteConfigModel != null) {
            emit(AuthState.fetchRemoteConfig(LoadingStatus.Done, remoteConfigModel!));
          } else {
            emit(AuthState.fetchRemoteConfig(LoadingStatus.Error, remoteConfigModel!));
          }
        } catch (e) {
          if (remoteConfigModel == null) {
            emit(AuthState.fetchRemoteConfigNull(LoadingStatus.Error));
          }
        }
        await _authService.check();
        if (_authService.isSuccess)
          emit(AuthState.loginSuccess(LoadingStatus.Initialized, _authService.isSuccess));
        else
          emit(AuthState.error(LoadingStatus.Error, _authService.message));
        // emit state.copyWith(isLoggedIn: _authService.isLoggedIn, bio: _authService.bio);
      }, logIn: (LoginRequestModel loginRequestModel) async {
        emit(AuthState.loading(LoadingStatus.InProgress));
        final val = await _authService.login(loginRequestModel);
        if (val && _authService.isSuccess)
          emit(AuthState.loginSuccess(LoadingStatus.Done, _authService.isSuccess));
        else
          emit(AuthState.error(LoadingStatus.Error, _authService.message));
      }, forgotPassword: (ForgotPasswordRequestModel forgotPasswordRequestModel) async {
        emit(AuthState.loading(LoadingStatus.InProgress));
        await _authService.forgotPassword(forgotPasswordRequestModel);
        if (_authService.isSuccess) {
          if (_authService.message == "") {
            emit(AuthState.forgetPasswordSuccess(LoadingStatus.Done, _authService.isSuccess));
          } else {
            emit(AuthState.error(LoadingStatus.Error, _authService.message));
          }
        } else {
          emit(AuthState.error(LoadingStatus.Error, _authService.message));
        }
      }, resetPassword: (ResetPasswordRequestModel resetPasswordRequestModel) async {
        emit(AuthState.loading(LoadingStatus.InProgress));
        final val = await _authService.resetPassword(resetPasswordRequestModel);
        if (val)
          emit(AuthState.resetPasswordSuccess(LoadingStatus.Done, _authService.isSuccess));
        else
          emit(AuthState.error(LoadingStatus.Error, _authService.message));
      }, logOut: () async {
        emit(AuthState.loading(LoadingStatus.InProgress));
        await _authService.logOut();
        emit(AuthState.load(LoadingStatus.Initialized, false));
      }, hasBio: () async {
        bool BioResp = await hasBiometrics();
        emit(AuthState.hasBio(LoadingStatus.Done, BioResp));
      }, fetchRemoteConfig: () async {
        emit(AuthState.loading(LoadingStatus.InProgress));
      });
    });
    add(
      AuthEvent.load(),
    );
  }
}

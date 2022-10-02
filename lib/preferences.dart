import 'dart:convert';
import 'package:flutter_app/models/login_model.dart';
import 'package:hive/hive.dart';

class Preferences {
  static const _preferencesBox = 'sso_pref_box';
  static const _loginModel = '_login_model';
  static const _isShieldOn = 'is_shield_on';
  static const _isBioMatric = '_is_bio_matric';
  static const _newLogIn = 'new_log_in';
  static const _isAlert = '_is_alert';
  static const _isAuth = '_is_auth';

  static const _homeScreenPath = 'home_screen_path';

  final Box<dynamic> _box;

  Preferences._(this._box);

  // This doesn't have to be a singleton.
  // We just want to make sure that the box is open, before we start getting/setting objects on it
  static Future<Preferences> getInstance() async {
    final box = await Hive.openBox<dynamic>(_preferencesBox);
    return Preferences._(box);
  }

  LoginModel? getToken() {
    String strLoginModel = _getValue<String>(_loginModel, defaultValue: "");
    if (strLoginModel == "") {
      return null;
    }
    return LoginModel.fromJson(jsonDecode(strLoginModel));
  }

  Future<void> setToken(LoginModel loginModel) {
    return _setValue<String>(_loginModel, jsonEncode(loginModel).toString());
  }

  Future<void> removeToken() => _removeValue(_loginModel);

  bool getShieldSettings() => _getValue<bool>(_isShieldOn, defaultValue: false);
  Future<void> setShieldSettings(bool value) => _setValue<bool>(_isShieldOn, value);
  Future<void> removeShield() => _removeValue(_isShieldOn);

  bool getAleartDialog() => _getValue<bool>(_isAlert, defaultValue: false);
  Future<void> setAleartDialog(bool value) => _setValue<bool>(_isAlert, value);
  Future<void> removeAleartDialog() => _removeValue(_isAlert);

  bool getAuthDialog() => _getValue<bool>(_isAuth, defaultValue: false);
  Future<void> setAuthDialog(bool value) => _setValue<bool>(_isAuth, value);
  Future<void> removeAuthDialog() => _removeValue(_isAuth);

  bool getBioMatric() => _getValue<bool>(_isBioMatric, defaultValue: false);

  Future<void> setBioMatric(bool value) => _setValue<bool>(_isBioMatric, value);

  Future<void> removeBioMatric() => _removeValue(_isBioMatric);

  bool getNewLogIn() => _getValue<bool>(_newLogIn, defaultValue: true);
  Future<void> turnOffNewLogIn() => _setValue<bool>(_newLogIn, false);
  Future<void> removeNewLogIn() => _removeValue(_newLogIn);

  Future<void> setHomeScreenPath(String path) => _setValue<String>(_homeScreenPath, path);
  Future<void> removeHomeScreenPath() => _removeValue(_homeScreenPath);

  //user logout
  Future<void> removeUserPreferences() async {
    await removeToken();
    await removeShield();
    await removeNewLogIn();
    await removeHomeScreenPath();
  }

  //reset to default
  Future<void> resetPreferences() async {
    await removeShield();
    await removeHomeScreenPath();
  }

  //clear all stored preference value
  //avoid using this
  Future<void> clearPreference() async {
    _box.clear();
  }

  T _getValue<T>(dynamic key, {T? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue) as T;
  }

  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);

  Future<void> _removeValue<T>(dynamic key) => _box.delete(key);
}

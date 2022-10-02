import 'dart:io';

import 'package:flutter_app/presentation/lifecycle/local_auth_api.dart';
import 'package:flutter_app/utils/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:move_to_background/move_to_background.dart';

import '../preferences.dart';

abstract class ISettingService {
  bool get bio;

  Future<void> setbiomatric(bool biomatri);

  Future<void> getbiomatric();
  Future<void> removebiomatric();

  Future<void> setAlertBox();
  Future<void> getAlertBox();
}

@Singleton(as: ISettingService)
class SettingService implements ISettingService {
  bool _bio = false;

  @override
  bool get bio => _bio;
  @override
  Future<void> setAlertBox() async {
    final _pref = await Preferences.getInstance();
    await _pref.setAleartDialog(true);
  }

  @override
  Future<void> getAlertBox() async {
    final _pref = await Preferences.getInstance();
    await _pref.getAleartDialog();
  }

  @override
  Future<void> setbiomatric(bool biomatri) async {
    final _pref = await Preferences.getInstance();
    await _pref.setBioMatric(biomatri);
    _bio = biomatri == true ? true : false;
  }

  @override
  Future<void> getbiomatric() async {
    final _pref = await Preferences.getInstance();
    bool bio = _pref.getBioMatric();
    _bio = bio == true ? true : false;
    if (bio) {
      final authenticated = await LocalAuthApi.authenticate();
      var check = authenticated.fold(
        (l) => InternalFailure(),
        (r) => r,
      );
      if (check == false) {
        if (Platform.isAndroid) {
          MoveToBackground.moveTaskToBack();
        }
      }
    }
  }

  @override
  Future<void> removebiomatric() async {
    final _pref = await Preferences.getInstance();
    await _pref.removeBioMatric();
  }
}

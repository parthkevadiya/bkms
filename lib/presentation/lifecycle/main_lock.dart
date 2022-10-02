import 'package:flutter/services.dart';
import 'dart:async';

class LockScreen {
  static const MethodChannel _channel = const MethodChannel('key_guardmanager');

  static Future<String> get moveTaskToBack async {
    final String ver = await _channel.invokeMethod('AuthStatus');
    return ver;
  }
}

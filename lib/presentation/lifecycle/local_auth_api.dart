import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/failure.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();
  static bool errorBio = false;

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      // print("==> $e");
      return <BiometricType>[];
    }
  }

  static Future<Either<Failure, bool>> authenticate() async {
    try {
      return Right(
        await _auth.authenticate(
          localizedReason: 'Scan Fingerprint to Authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      errorBio = true;
      return Left(
        InternalFailure(),
      );
    }
  }
}

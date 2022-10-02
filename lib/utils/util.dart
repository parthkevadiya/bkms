import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'constant.dart';

typedef void SnackBarCallBack(bool isClicked);

class Utils {
  String nullSafeString(String? strValue) {
    return strValue == null ? '' : strValue;
  }

  String nullSafeWithDefaultString(String? strValue, String defaultVal) {
    return (strValue == null || strValue.isEmpty) ? defaultVal : strValue;
  }

  int nullSafeInt(int? intValue) {
    return intValue == null ? 0 : intValue;
  }

  int nullSafeWithDefaultInt(int? intValue, int defaultVal) {
    return intValue == null ? defaultVal : intValue;
  }

  String removeFilterSign(String? strValue) {
    return (strValue == null || strValue == Constant.fDEFAULT_FILTER_ID) ? "" : strValue;
  }

  String removeFilterSignInt(int? intValue) {
    return (intValue == null || intValue == Constant.fDEFAULT_FILTER_ID_INT) ? "" : intValue.toString();
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validateWebURL(String value) {
    return Uri.parse(value).isAbsolute;
  }

  bool hasImageExtensions(String path) {
    var value = Utils().nullSafeString(path);
    return (value.toLowerCase().contains('.jpg') ||
        value.toLowerCase().contains('.png') ||
        value.toLowerCase().contains('.gif') ||
        value.toLowerCase().contains('.webp') ||
        value.toLowerCase().contains('.animated webp') ||
        value.toLowerCase().contains('.animated gif') ||
        value.toLowerCase().contains('.bmp') ||
        value.toLowerCase().contains('.wbmp'));
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xffF2994A),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showSnackBarWithCallback(BuildContext context, String message, String label, SnackBarCallBack snackBarCallBack) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: label,
        onPressed: () {
          snackBarCallBack.call(true);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<File> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<String> getPathToDownload() async {
    Directory? dir;
    if (Platform.isAndroid) {
      dir = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      dir = await getLibraryDirectory();
    } else {
      dir = await getTemporaryDirectory();
    }

    return dir!.path;
  }

  String changeDateFormat(DateTime dateTime, String requiredDateFormat) {
    final DateFormat formatter = DateFormat(requiredDateFormat);
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  String changeDateFormatString(String strDateTime, String currentFormat, String requiredDateFormat) {
    DateTime dateTime = stringToDateTime(strDateTime, currentFormat);

    final DateFormat formatter = DateFormat(requiredDateFormat);
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  DateTime stringToDateTime(String strDate, String dateFormat) {
    if (strDate.isEmpty) {
      return new DateTime.now();
    } else {
      try {
        return new DateFormat(dateFormat).parse(strDate);
      } catch (e) {
        if (dateFormat == Constant.defaultDateFormat) {
          return new DateFormat(Constant.defaultDateFormatWeb).parse(strDate);
        } else {
          return new DateFormat(Constant.defaultDateFormat).parse(strDate);
        }
      }
    }
  }

  String getCurrentDate(String requiredDateFormat) {
    var now = new DateTime.now();
    final DateFormat formatter = DateFormat(requiredDateFormat);
    final String formatted = formatter.format(now);
    return formatted;
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  TimeOfDay stringToTimeOfDay(String strTime) {
    if (strTime.isEmpty) {
      return new TimeOfDay.now();
    } else {
      int hh = 0;
      if (strTime.endsWith('PM')) hh = 12;
      strTime = strTime.split(' ')[0];
      return TimeOfDay(
        hour: hh + int.parse(strTime.split(":")[0]) % 24,
        // in case of a bad time format entered manually by the user
        minute: int.parse(strTime.split(":")[1]) % 60,
      );
    }
  }
}

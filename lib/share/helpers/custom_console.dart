import 'dart:developer' as developer;

import 'package:double_partners/config/constants/app_constants.dart' show kTag;
import 'package:double_partners/core/domain/enum/log_level_enum.dart';
import 'package:flutter/foundation.dart';

class CustomConsole {
  static void print(String message) {
    if (kDebugMode) {
      print('$kTag: $message');
    }
  }

  static void log({required String message, required LogLevel level, Object? error, StackTrace? stackTrace}) {
    switch (level) {
      case LogLevel.info:
        developer.log(message, name: kTag, error: error, stackTrace: stackTrace, level: 0);
        break;
      case LogLevel.warning:
        developer.log(message, name: kTag, error: error, stackTrace: stackTrace, level: 900);
        break;
      case LogLevel.severe:
        developer.log(message, name: kTag, error: error, stackTrace: stackTrace, level: 1000);
        break;
    }
  }
}

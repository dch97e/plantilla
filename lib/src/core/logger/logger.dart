import 'dart:developer';

import 'package:flutter/foundation.dart';

// ignore_for_file: avoid_print
class Log {
  static bool debugOnly = true;
  static bool showDate = false;
  static bool truncate = false;
  static int truncateSize = 8000;

  static void d(Object message, {Object? tag}) {
    if (!debugOnly && kDebugMode) return;

    log('\x1B[36m${_getTag(tag)}${_getLogMessage(message)}\x1B[0m');
  }

  static void e(Object message, {Object? tag}) {
    if (!debugOnly && kDebugMode) return;

    log('\x1B[31m${_getTag(tag)}${_getLogMessage(message)}\x1B[0m');
  }

  static void i(Object message, {Object? tag}) {
    if (!debugOnly && kDebugMode) return;

    log('\x1B[32m${_getTag(tag)}${_getLogMessage(message)}\x1B[0m');
  }

  static void v(Object message, {Object? tag}) {
    if (!debugOnly && kDebugMode) return;

    log(_getTag(tag) + _getLogMessage(message));
  }

  static void w(Object message, {Object? tag}) {
    if (!debugOnly && kDebugMode) return;

    log('\x1B[33m${_getTag(tag)}${_getLogMessage(message)}\x1B[0m');
  }

  static void wtf(Object message, {Object? tag}) {
    if (!debugOnly && kDebugMode) return;

    log('\x1B[35m${_getTag(tag)}${_getLogMessage(message)}\x1B[0m');
  }

  static String _getTag(Object? tag) {
    final date = showDate ? '${DateTime.now()} - ' : '';
    return tag != null ? '$date$tag: ' : date;
  }

  static String _getLogMessage(Object? message) {
    final messageSize = message.toString().length;

    final logMessage = (truncate && messageSize > truncateSize)
        ? message.toString().replaceRange(truncateSize, messageSize, '...')
        : message.toString();

    return logMessage;
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter_mvvm/model/exception/http_exception.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/app_action.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/app_error.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/base/error_bundle.dart';

abstract class ErrorBundleBuilder {
  final Exception exception;
  final AppAction appAction;

  ErrorBundleBuilder.create(this.exception, this.appAction);

  ErrorBundle handle(HTTPException exception, AppAction appAction);

  ErrorBundle build() {
    AppError appError = AppError.UNKNOWN;

    switch (exception.runtimeType) {
      case HTTPException:
        return handle((exception as HTTPException), appAction);
      case TimeoutException:
        appError = AppError.TIMEOUT;
        break;
      case SocketException:
        appError = AppError.NO_INTERNET;
        break;
    }

    return ErrorBundle(exception, appAction, appError);
  }
}

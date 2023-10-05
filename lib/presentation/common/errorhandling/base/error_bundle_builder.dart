import 'dart:async';
import 'dart:io';

import 'package:flutter_mvvm/model/exception/http_exception.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/app_action.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/app_error.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/base/error_bundle.dart';
import 'package:flutter_mvvm/presentation/common/localization/localization_manager.dart';

abstract class ErrorBundleBuilder {
  final Exception exception;
  final AppAction appAction;

  ErrorBundleBuilder.create(this.exception, this.appAction);

  ErrorBundle handle(HTTPException exception, AppAction appAction);

  ErrorBundle build() {
    AppError appError = AppError.UNKNOWN;
    String errorMessage = localizations.error_default;

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

    return ErrorBundle(exception, appAction, appError, errorMessage);
  }

  AppError getDefaultAppError(HTTPException httpException) {
    switch (httpException.statusCode) {
      case 404:
        return AppError.NOT_FOUND;
      case 500:
        return AppError.SERVER;
      case 401:
      case 402:
        return AppError.UNAUTHORIZED;
    }

    return AppError.UNKNOWN;
  }

  String getDefaultErrorMessage(HTTPException httpException) {
    switch (httpException.statusCode) {
      case 404:
        return localizations.error_not_found;
      case 500:
        return localizations.error_server;
      case 401:
      case 402:
        return localizations.error_unauthorized;
    }

    return localizations.error_default;
  }
}

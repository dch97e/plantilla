import 'dart:async';
import 'dart:io';

import '../../../shared.dart';

abstract class ErrorBundleBuilder {
  ErrorBundleBuilder.create(this.exception, this.appAction);
  final Exception exception;
  final AppAction appAction;

  ErrorBundle handle(HTTPException exception, AppAction appAction);

  ErrorBundle build() {
    var appError = AppError.UNKNOWN;
    var errorMessage = localizations.error_default;

    switch (exception.runtimeType) {
      case HTTPException:
        return handle((exception as HTTPException), appAction);
      case TimeoutException:
        appError = AppError.TIMEOUT;
        errorMessage = localizations.error_timeout;
      case SocketException:
        appError = AppError.NO_INTERNET;
        errorMessage = localizations.error_no_internet;
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

import '../../../../shared/shared.dart';

class AuthErrorBuilder extends ErrorBundleBuilder {
  AuthErrorBuilder.create(super.exception, super.appAction) : super.create();

  @override
  ErrorBundle handle(HTTPException exception, AppAction appAction) {
    var appError = getDefaultAppError(exception);
    var errorMessage = getDefaultErrorMessage(exception);

    switch (exception.statusCode) {
      case 500:
        appError = AppError.SERVER;
        errorMessage = localizations.error_server;
    }

    return ErrorBundle(exception, appAction, appError, errorMessage);
  }
}

import 'package:flutter_mvvm/model/exception/http_exception.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/app_action.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/app_error.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/base/error_bundle.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/base/error_bundle_builder.dart';

class AuthErrorBuilder extends ErrorBundleBuilder {
  AuthErrorBuilder.create(Exception exception, AppAction appAction)
      : super.create(exception, appAction);

  @override
  ErrorBundle handle(HTTPException exception, AppAction appAction) {
    AppError appError = AppError.UNKNOWN;

    switch (exception.statusCode) {
      case 500:
        appError = AppError.SERVER;
        break;
    }

    return ErrorBundle(exception, appAction, appError);
  }
}

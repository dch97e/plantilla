import 'package:flutter_mvvm/presentation/common/errorhandling/app_action.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/app_error.dart';

class ErrorBundle {
  final Exception exception;
  final AppAction appAction;
  final AppError appError;

  ErrorBundle(this.exception, this.appAction, this.appError);

  String get message {
    return exception.toString();
  }
}

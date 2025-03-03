import '../../../shared.dart';

class ErrorBundle {
  ErrorBundle(this.exception, this.appAction, this.appError, this.errorMessage);
  final Exception exception;
  final AppAction appAction;
  final AppError appError;
  final String errorMessage;

  String get message {
    return exception.toString();
  }
}

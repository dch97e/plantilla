import 'package:flutter_mvvm/presentation/common/errorhandling/error_bundle.dart';

// ignore: constant_identifier_names
enum Status { IDLE, LOADING, COMPLETED, ERROR }

class ResourceState {
  Status status;
  dynamic data;
  ErrorBundle? error;

  ResourceState(this.status, this.data, this.error);

  ResourceState.idle() : status = Status.IDLE;

  ResourceState.loading() : status = Status.LOADING;

  ResourceState.completed(this.data) : status = Status.COMPLETED;

  ResourceState.error(this.error) : status = Status.ERROR;
}

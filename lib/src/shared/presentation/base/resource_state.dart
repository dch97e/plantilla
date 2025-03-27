import '../../shared.dart';

sealed class ResourceState<T> {}

class LoadingState extends ResourceState {}

class SuccessState<T> extends ResourceState {
  SuccessState(this.data);
  final T data;
}

class ErrorState extends ResourceState {
  ErrorState(this.error);
  ErrorBundle error;
}

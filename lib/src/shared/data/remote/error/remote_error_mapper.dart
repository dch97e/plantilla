import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../shared.dart';

class RemoteErrorMapper {
  RemoteErrorMapper();

  static Exception getException(dynamic error) {
    switch (error) {
      case final DioException dioException:
        switch (dioException.type) {
          case DioExceptionType.connectionTimeout:
            return TimeoutException(dioException.message);
          case DioExceptionType.sendTimeout:
            return TimeoutException(dioException.message);
          case DioExceptionType.receiveTimeout:
            return TimeoutException(dioException.message);
          case DioExceptionType.badResponse:
            return HTTPException(
              (dioException.response?.statusCode) ?? -1,
              (dioException.response?.data.toString()) ?? '',
            );
          case DioExceptionType.unknown:
          case DioExceptionType.connectionError:
            if (dioException.error.toString().contains('SocketException')) {
              return SocketException(dioException.error.toString());
            }

            return Exception();
          case DioExceptionType.badCertificate:
            return Exception();
          case DioExceptionType.cancel:
            return Exception();
        }
      case TypeError _:
        return Exception('Type error');
      default:
        return error is Exception ? error : Exception();
    }
  }
}

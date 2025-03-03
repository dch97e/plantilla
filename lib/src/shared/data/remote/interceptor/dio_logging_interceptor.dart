import 'dart:developer';

import 'package:dio/dio.dart';

class DioLoggingInterceptor {
  static Interceptor getInterceptor() => LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (data) {
          log(data.toString());
        },
      );
}

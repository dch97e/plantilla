import 'package:dio/dio.dart';

import '../../../../core/core.dart';

class DioLoggingInterceptor {
  static Interceptor getInterceptor() => LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (data) {
          Log.d(data.toString());
        },
      );
}

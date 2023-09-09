
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:dio/dio.dart';

import '../../services/service_locator.dart';
import '../cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[Apikeys.token] = sl<CacheHelper>().getData(key: Apikeys.token) != null
        ? 'FOODAPI ${sl<CacheHelper>().getData(key: Apikeys.token)}'
        : null;
    

    super.onRequest(options, handler);
  }
}

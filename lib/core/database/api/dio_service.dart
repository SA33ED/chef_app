import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:dio/dio.dart';

class DioService extends ApiConsumer {
  final Dio dio;
  DioService(this.dio);
//!Delete
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

//!Get
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

//!Patch
  @override
  Future patch(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

//!Post
  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}

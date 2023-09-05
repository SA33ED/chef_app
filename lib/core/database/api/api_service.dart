import 'package:chef_app/core/database/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = EndPoint.baseUrl;
  final Dio _dio;
  ApiService(this._dio);

//!Get
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response<dynamic> response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}

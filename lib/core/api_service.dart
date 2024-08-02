import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.alquran.cloud/v1/';
  final Dio _dio;

  ApiService(this._dio);

//(!) quran/ar.alafasy
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}

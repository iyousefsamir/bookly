import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    for (int i = 0; i < 3; i++) {
      try {
        final response = await _dio.get('$_baseUrl$endpoint');
        return response.data;
      } on DioException catch (e) {
        if (e.response?.statusCode == 503 && i < 2) {
          await Future.delayed(const Duration(seconds: 1));
        } else {
          rethrow;
        }
      }
    }

    throw Exception('Request failed');
  }
}

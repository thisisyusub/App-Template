import 'package:dio/dio.dart';

class ApiService {
  ApiService._internal() {
    dio = new Dio();
    dio.options
      ..baseUrl = 'https://jsonplaceholder.typicode.com/'
      ..connectTimeout = 2000
      ..contentType = 'application/Json';
  }

  Dio dio;

  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }
}

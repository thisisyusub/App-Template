/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

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

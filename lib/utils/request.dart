import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_quickstart/utils/preferences.dart';

class Service {
  static Dio dio;

  static const String API_BASE_URL = 'https://test.api.web.724cheers.com';
  static const int CONNECT_TIMEOUT = 6000;
  static const int RECEIVE_TIMEOUT = 6000;

  static const CONTENT_TYPE = 'application/x-www-form-urlencoded';

  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static clear() {
    dio = null;
  }

  static Future<Dio> createInstance() async {
    Map<String, dynamic> headers = {};
    String token = await Prefs.getString('token');
    if (token != null && token != '') {
      headers['AUTH-TOKEN'] = token;
    }

    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: API_BASE_URL,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
        contentType: CONTENT_TYPE,
        headers: headers,
      );
      dio = new Dio(options);
    }

    return dio;
  }

  static Future<Map> request(String url, {data, method}) async {
    var result;
    Dio dio = await createInstance();
    data = data ?? {};
    method = method ?? 'GET';

    data.forEach((key, value) {
      if (url.indexOf(key) > -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response = await dio.request(url,
          data: data, options: new Options(method: method));
      result = json.decode(response.toString());
    } on DioError catch (e) {
      print('request error: ' + e.toString());
    }

    return result;
  }
}

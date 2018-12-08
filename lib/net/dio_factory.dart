import 'package:dio/dio.dart';

class DioFactory {
  static Dio _dio;
  static final DioFactory _singleton = _init();

  factory DioFactory() {
    return _singleton;
  }

  static _init() {
    _dio = new Dio();
  }

  getDio() {
    return _dio;
  }
}

//测试是否是单例
void main() {
  print(DioFactory().getDio() == DioFactory().getDio());
}

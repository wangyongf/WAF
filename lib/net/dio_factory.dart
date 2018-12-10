import 'package:dio/dio.dart';

class DioFactory {
  factory DioFactory() => _getInstance();
  static DioFactory _instance;
  static Dio _dio;

  DioFactory._internal() {
    _dio = Dio();
  }

  static DioFactory _getInstance() {
    if (_instance == null) {
      _instance = DioFactory._internal();
    }
    return _instance;
  }

  getDio() {
    return _dio;
  }
}

//测试是否是单例
void main() {
  print(DioFactory().getDio() == DioFactory().getDio());
}

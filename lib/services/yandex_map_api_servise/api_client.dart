import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class MapApiClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://geocode-maps.yandex.ru/1.x/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  MapApiClient() {
    _init();
  }

  Future _init() async {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }
}
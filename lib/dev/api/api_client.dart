import 'package:dio/dio.dart';
import 'package:isar_mobx_login_test/helpers/configuration.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static BaseOptions options = BaseOptions(baseUrl: Configuration.base_url);
  final Dio dio = Dio(options)
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  Dio get _dio => dio;
}

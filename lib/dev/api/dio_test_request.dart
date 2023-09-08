import 'package:dio/dio.dart';
import 'package:isar_mobx_login_test/dev/models/post.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../helpers/configuration.dart';

class DioClient {
  static BaseOptions options = BaseOptions(baseUrl: Configuration.base_url);
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  Future getPosts() async {
    Response response;

    response = await dio.get(options.baseUrl + "posts");
    final data = response.data.map((post) => Post.fromMap(post)).toList();

    return data;
  }
}

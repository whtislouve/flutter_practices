import 'package:dio/dio.dart';
import 'package:isar_mobx_login_test/dev/models/post.dart';
import 'package:isar_mobx_login_test/dev/stores/dio_store.dart';
import 'package:mobx/mobx.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../helpers/configuration.dart';

abstract class PostRepository {
  Future getPostFromServer();
  void addPostDataToStore(List data);
  Future getPostDataFromStore();
}

class DioPostRepository implements PostRepository {
  static BaseOptions options = BaseOptions(baseUrl: Configuration.base_url);
  static List data = [];
  final store = DioStore();
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  Future getPostFromServer() async {
    Response? response;
    try {
      response = await dio.get(options.baseUrl + "posts");
      data = response.data.map((post) => Post.fromMap(post)).toList();
      addPostDataToStore(data);
    } on DioException catch (e) {
      throw {e};
    }
  }

  void addPostDataToStore(List data) {
    store.postList = data;
  }

  Future getPostDataFromStore() async {
    getPostFromServer();
    return store.postList;
  }
}

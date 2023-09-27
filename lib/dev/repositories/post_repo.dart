import 'package:dio/dio.dart';
import 'package:isar_mobx_login_test/dev/api/api_client.dart';
import 'package:isar_mobx_login_test/dev/models/post.dart';
import 'package:isar_mobx_login_test/dev/stores/dio_store.dart';

abstract class PostRepository {
  Future getPostFromServer();
  void addPostDataToStore(List data);
  Future getPostDataFromStore();
}

class DioPostRepository implements PostRepository {
  static List data = [];
  final store = DioStore();
  ApiClient apiClient = ApiClient();

  Future getPostFromServer() async {
    Response? response;
    try {
      response =
          await apiClient.dio.get(apiClient.dio.options.baseUrl + "posts");

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

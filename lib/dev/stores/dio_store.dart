import 'dart:convert';

import 'package:isar_mobx_login_test/dev/api/dio_test_request.dart';
import 'package:mobx/mobx.dart';

import '../models/post.dart';

part 'dio_store.g.dart';

class DioStore = _DioStore with _$DioStore;

abstract class _DioStore with Store {
  late final dio = DioClient();
  @observable
  List postList = [];

  @observable
  bool isPostListLoading = false;

  @action
  Future getPosts() async {
    isPostListLoading = true;
    postList = await dio.getPosts();
    isPostListLoading = false;
  }
}

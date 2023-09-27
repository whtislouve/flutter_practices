import 'dart:convert';

import 'package:isar_mobx_login_test/dev/repositories/post_repo.dart';
import 'package:mobx/mobx.dart';

import '../models/post.dart';

part 'dio_store.g.dart';

class DioStore = _DioStore with _$DioStore;

abstract class _DioStore with Store {
  late final DioPostRepository postRepository = DioPostRepository();
  @observable
  List postList = [];

  @observable
  bool isPostListLoading = false;

  // @action
  // Future getPosts() async {
  //   isPostListLoading = true;
  //   postList = await postRepository.getPostFromServer();
  //   isPostListLoading = false;
  // }
}

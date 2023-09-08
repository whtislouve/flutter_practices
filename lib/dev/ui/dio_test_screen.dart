import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:isar_mobx_login_test/dev/api/dio_test_request.dart';
import 'package:isar_mobx_login_test/dev/stores/dio_store.dart';
import 'package:mobx/mobx.dart';

import '../models/post.dart';

class DioTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DioTest();
}

class _DioTest extends State<DioTest> {
  _DioTest({Key? key});
  // List response = [];
  // final DioClient _dioClient = DioClient();
  var store = DioStore();

  @override
  void initState() {
    getPostFromStore();

    super.initState();
  }

  Future getPostFromStore() async {
    await store.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (store.isPostListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: store.postList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(store.postList[index].body),
              );
            },
          );
        },
      ),
    );
  }
}
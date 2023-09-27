import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:isar_mobx_login_test/dev/repositories/post_repo.dart';

class DioTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DioTest();
}

class _DioTest extends State<DioTest> {
  _DioTest({Key? key});
  var repo = DioPostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: repo.getPostDataFromStore(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text("Bad connection to the server"),
            );
          }
          return Observer(builder: (context) {
            if (repo.store.isPostListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: repo.store.postList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(repo.store.postList[index].body),
                );
              },
            );
          });
        },
      ),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DioStore on _DioStore, Store {
  late final _$postListAtom =
      Atom(name: '_DioStore.postList', context: context);

  @override
  List<dynamic> get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(List<dynamic> value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  late final _$isPostListLoadingAtom =
      Atom(name: '_DioStore.isPostListLoading', context: context);

  @override
  bool get isPostListLoading {
    _$isPostListLoadingAtom.reportRead();
    return super.isPostListLoading;
  }

  @override
  set isPostListLoading(bool value) {
    _$isPostListLoadingAtom.reportWrite(value, super.isPostListLoading, () {
      super.isPostListLoading = value;
    });
  }

  late final _$getPostsAsyncAction =
      AsyncAction('_DioStore.getPosts', context: context);

  @override
  Future<dynamic> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  @override
  String toString() {
    return '''
postList: ${postList},
isPostListLoading: ${isPostListLoading}
    ''';
  }
}

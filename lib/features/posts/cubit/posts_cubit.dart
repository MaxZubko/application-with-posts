import 'dart:async';

import 'package:application_with_posts_app/api/api.dart';
import 'package:application_with_posts_app/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({
    required PostsApiClient apiClient,
  })  : _apiClient = apiClient,
        super(PostsInitial()) {
    getPosts();
  }

  final PostsApiClient _apiClient;

  Future<void> getPosts({int userId = 1}) async {
    try {
      emit(PostsLoading());
      final posts = await _apiClient.getPostListByUserId(userId);
      emit(PostsLoaded(postsList: posts));
    } catch (e) {
      emit(PostsFailure(error: e));
    }
  }
}

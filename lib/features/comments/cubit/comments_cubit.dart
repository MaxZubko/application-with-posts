import 'package:application_with_posts_app/api/api.dart';
import 'package:application_with_posts_app/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit({
    required PostsApiClient apiClient,
    required int postId,
  })  : _apiClient = apiClient,
        super(CommentsInitial()) {
    getComments(postId: postId);
  }

  final PostsApiClient _apiClient;

  Future<void> getComments({required int postId}) async {
    try {
      emit(CommentsLoading());
      final comments = await _apiClient.getCommentsList();

      /// Find messages under the corresponding post
      final List<CommentsModel> commentsByPostId =
          comments.where((element) => element.postId == postId).toList();

      emit(CommentsLoaded(commentsList: commentsByPostId));
    } catch (e) {
      emit(CommentsFailure(error: e));
    }
  }
}

part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostsModel> postsList;

  const PostsLoaded({required this.postsList});

  @override
  List<Object> get props => [postsList];
}

class PostsFailure extends PostsState {
  final Object error;

  const PostsFailure({required this.error});

  @override
  List<Object> get props => [error];
}

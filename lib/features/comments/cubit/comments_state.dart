part of 'comments_cubit.dart';

sealed class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

final class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<CommentsModel> commentsList;

  const CommentsLoaded({required this.commentsList});

  @override
  List<Object> get props => [commentsList];
}

class CommentsFailure extends CommentsState {
  final Object error;

  const CommentsFailure({required this.error});

  @override
  List<Object> get props => [error];
}

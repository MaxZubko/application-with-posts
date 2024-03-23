part of 'users_cubit.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersLoaded extends UsersState {
  final List<UsersModel> usersList;
  final int userId;

  const UsersLoaded({
    required this.usersList,
    required this.userId,
  });

  @override
  List<Object> get props => [usersList];
}

final class UsersFailure extends UsersState {
  final Object error;

  const UsersFailure({required this.error});

  @override
  List<Object> get props => [error];
}

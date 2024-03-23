import 'package:application_with_posts_app/api/api.dart';
import 'package:application_with_posts_app/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({
    required PostsApiClient apiClient,
  })  : _apiClient = apiClient,
        super(UsersInitial()) {
    getUsers();
  }

  final PostsApiClient _apiClient;

  Future<void> getUsers({int userId = 1}) async {
    try {
      emit(UsersLoading());
      final users = await _apiClient.getUsersList();
      emit(UsersLoaded(usersList: users, userId: userId));
    } catch (error) {
      emit(UsersFailure(error: error));
    }
  }
}

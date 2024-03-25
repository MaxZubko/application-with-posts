import 'dart:async';

import 'package:application_with_posts_app/cubit/users_cubit.dart';
import 'package:application_with_posts_app/features/posts/cubit/posts_cubit.dart';
import 'package:application_with_posts_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late UsersCubit usersCubit;

  @override
  void initState() {
    super.initState();
    usersCubit = BlocProvider.of<UsersCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final state = usersCubit.state;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            if (state is UsersLoaded) ...[
              SliverList.builder(
                itemCount: state.usersList.length,
                itemBuilder: (context, i) {
                  final name = state.usersList[i].name;
                  final userName = state.usersList[i].username;
                  final title = '$name ($userName)';
                  return GestureDetector(
                    onTap: () async {
                      await _changeCurrentUser(
                        context,
                        usersCubit,
                        state.usersList[i].id,
                      ).then((value) => Navigator.pop(context));
                    },
                    child: ListCard(
                      title: title,
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _changeCurrentUser(
      BuildContext context, UsersCubit usersCubit, int userId) async {
    final postsCubit = BlocProvider.of<PostsCubit>(context);
    final completer = Completer();
    usersCubit.getUsers(userId: userId, completer: completer);
    await completer.future;
    postsCubit.getPosts(userId: userId);
  }
}

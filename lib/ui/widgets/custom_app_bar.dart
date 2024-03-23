import 'package:application_with_posts_app/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoaded) {
            final userName = state.usersList[state.userId - 1];
            return Text(userName.name);
          }
          return const Text('');
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

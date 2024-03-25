import 'package:application_with_posts_app/constants/assets.dart';
import 'package:application_with_posts_app/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHomeScreen;
  final String? title;
  final VoidCallback? onPressed;
  const CustomAppBar({
    super.key,
    this.title,
    this.onPressed,
    this.isHomeScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: title != null
          ? Text(
              title!,
            )
          : BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                if (state is UsersLoaded) {
                  final userName = state.usersList[state.userId - 1];
                  return Text(
                    userName.name,
                  );
                }
                return const Text('');
              },
            ),
      actions: [
        if (isHomeScreen)
          IconButton(
            icon: Image.asset(
              Assets.userIcon,
              height: 25,
            ),
            onPressed: onPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

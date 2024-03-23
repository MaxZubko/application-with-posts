import 'package:application_with_posts_app/api/api.dart';
import 'package:application_with_posts_app/cubit/users_cubit.dart';
import 'package:application_with_posts_app/features/posts/cubit/posts_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/posts/posts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final getIt = GetIt.instance;

  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<PostsApiClient>(PostsApiClient(getIt<Dio>()));

  runApp(const PostsApp());
}

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostsCubit(
            apiClient: GetIt.I<PostsApiClient>(),
          ),
        ),
        BlocProvider(
          create: (context) => UsersCubit(
            apiClient: GetIt.I<PostsApiClient>(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostsScreen(),
      ),
    );
  }
}

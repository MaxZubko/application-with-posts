import 'package:application_with_posts_app/features/posts/cubit/posts_cubit.dart';
import 'package:application_with_posts_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                if (state is PostsLoaded) {
                  return SliverList.builder(
                    itemCount: state.postsList.length,
                    itemBuilder: (context, i) {
                      return SizedBox(
                        height: 100,
                        child: Text(
                          state.postsList[i].title,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  );
                }

                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

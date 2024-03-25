import 'package:application_with_posts_app/features/comments/view/comments_screen.dart';
import 'package:application_with_posts_app/features/posts/cubit/posts_cubit.dart';
import 'package:application_with_posts_app/features/users/users.dart';
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
      appBar: CustomAppBar(
        isHomeScreen: true,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UsersScreen(),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                if (state is PostsLoaded) {
                  return SliverList.builder(
                    itemCount: state.postsList.length,
                    itemBuilder: (context, i) {
                      final post = state.postsList[i];

                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentsScreen(
                              postId: post.id,
                            ),
                          ),
                        ),
                        child: ListCard(
                          title: post.title,
                          body: post.body,
                        ),
                      );
                    },
                  );
                }

                if (state is PostsFailure) {
                  return const Text('Something went wrong');
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

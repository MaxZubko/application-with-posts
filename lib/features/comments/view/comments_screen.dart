import 'package:application_with_posts_app/api/api.dart';
import 'package:application_with_posts_app/features/comments/cubit/comments_cubit.dart';
import 'package:application_with_posts_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CommentsScreen extends StatelessWidget {
  final int postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsCubit(
        apiClient: GetIt.I<PostsApiClient>(),
        postId: postId,
      ),
      child: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          final isLoaded = state is CommentsLoaded;
          return Scaffold(
            appBar: CustomAppBar(
              title: isLoaded
                  ? 'Comments (${state.commentsList.length})'
                  : 'Comments',
            ),
            body: SafeArea(
              bottom: false,
              child: CustomScrollView(
                slivers: [
                  if (isLoaded) ...[
                    SliverList.builder(
                      itemCount: state.commentsList.length,
                      itemBuilder: (context, i) {
                        final comment = state.commentsList[i];

                        return ListCard(
                          title: comment.email,
                          body: comment.body,
                        );
                      },
                    ),
                  ] else if (state is CommentsFailure) ...[
                    const SliverToBoxAdapter(
                      child: Text('Something went wrong'),
                    ),
                  ] else ...[
                    const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:application_with_posts_app/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class PostsApiClient {
  factory PostsApiClient(Dio dio) = _PostsApiClient;

  @GET('/users')
  Future<List<UsersModel>> getUsersList();

  @GET('/posts')
  Future<List<PostsModel>> getPostListByUserId(@Query('userId') int userId);

  @GET('/comments')
  Future<List<CommentsModel>> getCommentsList();
}

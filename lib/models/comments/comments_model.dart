import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel {
  final int postId;
  final int commentId;
  final String email;
  final String body;

  CommentsModel({
    required this.postId,
    required this.commentId,
    required this.email,
    required this.body,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}

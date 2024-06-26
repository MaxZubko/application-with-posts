import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable()
class CommentsModel {
  final int postId;
  final int id;
  final String email;
  final String body;

  CommentsModel({
    required this.postId,
    required this.id,
    required this.email,
    required this.body,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
}

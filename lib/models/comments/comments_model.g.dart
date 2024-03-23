// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      postId: json['postId'] as int,
      commentId: json['commentId'] as int,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'commentId': instance.commentId,
      'email': instance.email,
      'body': instance.body,
    };

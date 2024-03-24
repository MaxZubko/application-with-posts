// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) =>
    CommentsModel(
      postId: json['postId'] as int,
      id: json['id'] as int,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'email': instance.email,
      'body': instance.body,
    };

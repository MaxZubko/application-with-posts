// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
      json['username'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
    };

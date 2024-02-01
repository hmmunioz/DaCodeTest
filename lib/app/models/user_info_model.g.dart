// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      login: json['login'] as String,
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'type': instance.type,
    };

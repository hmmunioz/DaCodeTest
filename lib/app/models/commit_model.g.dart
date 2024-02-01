// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommitModel _$CommitModelFromJson(Map<String, dynamic> json) => CommitModel(
      author: UserModel.fromJson(json['author'] as Map<String, dynamic>),
      committer: UserModel.fromJson(json['committer'] as Map<String, dynamic>),
      message: json['message'] as String,
      tree: TreeModel.fromJson(json['tree'] as Map<String, dynamic>),
      url: json['url'] as String,
    );

Map<String, dynamic> _$CommitModelToJson(CommitModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'committer': instance.committer,
      'message': instance.message,
      'tree': instance.tree,
      'url': instance.url,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_commit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCommitModel _$ResponseCommitModelFromJson(Map<String, dynamic> json) =>
    ResponseCommitModel(
      sha: json['sha'] as String,
      commit: CommitModel.fromJson(json['commit'] as Map<String, dynamic>),
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      author: UserInfoModel.fromJson(json['author'] as Map<String, dynamic>),
      committer:
          UserInfoModel.fromJson(json['committer'] as Map<String, dynamic>),
      parents: (json['parents'] as List<dynamic>)
          .map((e) => ParentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseCommitModelToJson(
        ResponseCommitModel instance) =>
    <String, dynamic>{
      'sha': instance.sha,
      'commit': instance.commit,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'author': instance.author,
      'committer': instance.committer,
      'parents': instance.parents,
    };

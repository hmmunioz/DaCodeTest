import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final String login;
  final int id;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  final String url;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  final String type;

  UserInfoModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
    required this.type,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}

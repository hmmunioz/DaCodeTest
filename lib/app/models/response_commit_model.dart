import 'package:fulltimeforce_test/app/models/commit_model.dart';
import 'package:fulltimeforce_test/app/models/parent_model.dart';
import 'package:fulltimeforce_test/app/models/user_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_commit_model.g.dart';

@JsonSerializable()
class ResponseCommitModel {
  final String sha;

  final CommitModel commit;
  final String url;
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  final UserInfoModel author;
  final UserInfoModel committer;
  final List<ParentModel> parents;

  ResponseCommitModel({
    required this.sha,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  factory ResponseCommitModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseCommitModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseCommitModelToJson(this);
}

import 'package:fulltimeforce_test/app/models/tree_model.dart';
import 'package:fulltimeforce_test/app/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commit_model.g.dart';

@JsonSerializable()
class CommitModel {
  final UserModel author;
  final UserModel committer;
  final String message;
  final TreeModel tree;
  final String url;

  CommitModel({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
  });

  factory CommitModel.fromJson(Map<String, dynamic> json) =>
      _$CommitModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommitModelToJson(this);
}

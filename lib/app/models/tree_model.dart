import 'package:json_annotation/json_annotation.dart';

part 'tree_model.g.dart';

@JsonSerializable()
class TreeModel {
  final String sha;
  final String url;

  TreeModel({required this.sha, required this.url});

  factory TreeModel.fromJson(Map<String, dynamic> json) =>
      _$TreeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TreeModelToJson(this);
}

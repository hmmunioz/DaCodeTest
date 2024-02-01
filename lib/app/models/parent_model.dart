import 'package:json_annotation/json_annotation.dart';

part 'parent_model.g.dart';

@JsonSerializable()
class ParentModel {
  final String sha;
  final String url;

  ParentModel({
    required this.sha,
    required this.url,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) =>
      _$ParentModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParentModelToJson(this);
}

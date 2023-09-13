import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final String source;
  final String value;

  const Rating({
    required this.source,
    required this.value,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      source: json['Source'] ?? '',
      value: json['Value'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'Source': source,
      'Value': value,
    };

    return data;
  }

  @override
  List<Object?> get props => [
        source,
        value,
      ];
}

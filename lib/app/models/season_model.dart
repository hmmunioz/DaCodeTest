import 'package:equatable/equatable.dart';

class SeasonModel extends Equatable {
  final String title;
  final String season;
  final String totalSeasons;
  final List<Episode> episodes;
  final String response;

  const SeasonModel({
    required this.title,
    required this.season,
    required this.totalSeasons,
    required this.episodes,
    required this.response,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      title: json['Title'] ?? '',
      season: json['Season'] ?? '',
      totalSeasons: json['totalSeasons'] ?? 0,
      episodes: (json['Episodes'] as List)
          .map((episodeJson) => Episode.fromJson(episodeJson))
          .toList(),
      response: json['Response'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        season,
        totalSeasons,
        episodes,
        response,
      ];
}

class Episode extends Equatable {
  final String title;
  final String released;
  final String episode;
  final String imdbRating;
  final String imdbID;

  const Episode({
    required this.title,
    required this.released,
    required this.episode,
    required this.imdbRating,
    required this.imdbID,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      title: json['Title'] ?? '',
      released: json['Released'] ?? '',
      episode: json['Episode'] ?? '',
      imdbRating: json['imdbRating'] ?? '',
      imdbID: json['imdbID'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        released,
        episode,
        imdbRating,
        imdbID,
      ];
}

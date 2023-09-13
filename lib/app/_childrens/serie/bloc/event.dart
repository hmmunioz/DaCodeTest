part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class GetSeriesEvent extends Event {
  final String search;
  const GetSeriesEvent(
    this.search,
  );
}

class GetSeasonEvent extends Event {
  final String search;
  final int season;
  const GetSeasonEvent(
    this.search,
    this.season,
  );
}

class GetEpisodeEvent extends Event {
  final String search;
  final int episode;
  final int season;
  const GetEpisodeEvent(
    this.search,
    this.episode,
    this.season,
  );
}

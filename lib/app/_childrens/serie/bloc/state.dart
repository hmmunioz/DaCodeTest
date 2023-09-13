part of 'bloc.dart';

abstract class State extends Equatable {
  const State(this.model);

  final Model model;

  @override
  List<Object?> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class LoadingSeriesState extends State {
  const LoadingSeriesState(Model model) : super(model);
}

class LoadedSeriesState extends State {
  const LoadedSeriesState(Model model) : super(model);
}

class LoadingSeasonState extends State {
  const LoadingSeasonState(Model model) : super(model);
}

class LoadedSeasonState extends State {
  const LoadedSeasonState(Model model) : super(model);
}

class LoadingEpisodeState extends State {
  const LoadingEpisodeState(Model model) : super(model);
}

class LoadedEpisodeState extends State {
  const LoadedEpisodeState(Model model) : super(model);
}

class ErrorState extends State {
  const ErrorState(Model model) : super(model);
}

class SelectFilterState extends State {
  const SelectFilterState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.serie,
    this.season,
    this.episode,
  });

  final SerieModel? serie;
  final SeasonModel? season;
  final EpisodeModel? episode;

  Model copyWith({
    SerieModel? serie,
    SeasonModel? season,
    EpisodeModel? episode,
  }) {
    return Model(
      serie: serie ?? this.serie,
      season: season ?? this.season,
      episode: episode ?? this.episode,
    );
  }

  @override
  List<Object?> get props => [
        serie,
        season,
        episode,
      ];
}

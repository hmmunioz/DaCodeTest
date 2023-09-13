import 'package:bloc/bloc.dart' as bloc;
import 'package:dacodes_test/app/models/episode_model.dart';
import 'package:dacodes_test/app/models/season_model.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:dacodes_test/app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc({Repository? repository})
      : repository = repository ??= Repository(),
        super(const InitialState(Model())) {
    on<GetSeriesEvent>(_onGetSeriesEvent);
    on<GetSeasonEvent>(_onGetSeasonEvent);
    on<GetEpisodeEvent>(_onGetEpisodeEvent);
  }

  late Repository repository;

  Future<Model> _getSeriesEvent({String? search}) async {
    final serieResponse = await repository.getSeriesApi(search: search);
    return state.model.copyWith(
      serie: serieResponse,
    );
  }

  void _onGetSeriesEvent(
    GetSeriesEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSeriesState(state.model));
    try {
      final model = await _getSeriesEvent(search: event.search);
      emit(LoadedSeriesState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  Future<Model> _getSeason({String search = '', int season = 1}) async {
    final seasonResponse = await repository.getSeasonApi(
      search: search,
      season: season,
    );
    return state.model.copyWith(
      season: seasonResponse,
    );
  }

  void _onGetSeasonEvent(
    GetSeasonEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingSeasonState(state.model));
    try {
      final model = await _getSeason(
        search: event.search,
        season: event.season,
      );
      emit(LoadedSeasonState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  Future<Model> _getEpisode(
      {String search = '', int season = 1, int episode = 1}) async {
    final episodeResponse = await repository.getEpisodeApi(
      search: search,
      season: season,
      episode: episode,
    );
    return state.model.copyWith(
      episode: episodeResponse,
    );
  }

  void _onGetEpisodeEvent(
    GetEpisodeEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingEpisodeState(state.model));
    try {
      final model = await _getEpisode(
        search: event.search,
        season: event.season,
        episode: event.episode,
      );
      emit(LoadedEpisodeState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }
}

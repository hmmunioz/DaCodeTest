import 'package:bloc_test/bloc_test.dart';
import 'package:dacodes_test/app/models/episode_model.dart';
import 'package:dacodes_test/app/models/season_model.dart';
import 'package:dacodes_test/app/models/serie_model.dart';
import 'package:dacodes_test/app/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dacodes_test/app/_childrens/serie/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements Repository {}

final mockRepository = MockRepository();
String serieName = 'Game of Thrones';
String serieNameError = 'example';
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Bloc bloc;
  SerieModel? serieModel;
  SeasonModel? seasonModel;
  EpisodeModel? episodeModel;
  setUpAll(() => bloc = Bloc(repository: mockRepository));

  blocTest<Bloc, State>(
    'emits LoadingSeriesState and LoadedSeriesState when GetSeriesEvent is added',
    build: () {
      when(
        () => mockRepository.getSeriesApi(search: ''),
      ).thenAnswer((_) async => serieModel);
      return bloc;
    },
    act: (bloc) => bloc.add(const GetSeriesEvent('')),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoadingSeriesState(Model()),
      const LoadedSeriesState(Model()),
    ],
  );
  blocTest<Bloc, State>(
    'emits LoadingSeriesState and ErrorState when GetSeriesEvent is added',
    build: () {
      when(
        () => mockRepository.getSeriesApi(),
      ).thenAnswer((_) async => serieModel);
      return bloc;
    },
    act: (bloc) => bloc.add(const GetSeriesEvent('')),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoadingSeriesState(Model()),
      const ErrorState(Model()),
    ],
  );

  blocTest<Bloc, State>(
    'emits LoadingSeasonState and LoadedSeasonState when GetSeasonEvent is added',
    build: () {
      when(
        () => mockRepository.getSeasonApi(search: serieName, season: 1),
      ).thenAnswer((_) async => seasonModel);
      return bloc;
    },
    act: (bloc) => bloc.add(GetSeasonEvent(serieName, 1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoadingSeasonState(Model()),
      const LoadedSeasonState(Model()),
    ],
  );
  blocTest<Bloc, State>(
    'emits LoadingSeasonState and ErrorState when GetSeasonEvent is added',
    build: () {
      when(
        () => mockRepository.getSeasonApi(search: serieNameError, season: 0),
      ).thenAnswer((_) async => seasonModel);
      return bloc;
    },
    act: (bloc) => bloc.add(GetSeasonEvent(serieNameError, 0)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoadingSeasonState(Model()),
      const ErrorState(Model()),
    ],
  );

  blocTest<Bloc, State>(
    'emits LoadingEpisodeState and LoadedEpisodeState when GetEpisodeEvent is added',
    build: () {
      when(
        () => mockRepository.getEpisodeApi(
          search: serieName,
          season: 1,
          episode: 1,
        ),
      ).thenAnswer((_) async => episodeModel);
      return bloc;
    },
    act: (bloc) => bloc.add(GetEpisodeEvent(serieName, 1, 1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoadingEpisodeState(Model()),
      const LoadedEpisodeState(Model()),
    ],
  );
  blocTest<Bloc, State>(
    'emits LoadingEpisodeState and ErrorState when GetEpisodeEvent is added',
    build: () {
      when(
        () => mockRepository.getEpisodeApi(
          search: '',
          season: 0,
          episode: 0,
        ),
      ).thenAnswer((_) async => episodeModel);
      return bloc;
    },
    act: (bloc) => bloc.add(GetEpisodeEvent(serieNameError, 1, 1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoadingEpisodeState(Model()),
      const ErrorState(Model()),
    ],
  );
  tearDown(() {
    bloc.close();
  });
}

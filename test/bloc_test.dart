import 'package:bloc_test/bloc_test.dart';
import 'package:fulltimeforce_test/app/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fulltimeforce_test/app/_childrens/commits/bloc/bloc.dart'
    as commit_bloc;
import 'package:fulltimeforce_test/app/models/response_commit_model.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late commit_bloc.Bloc commitsBloc;
  late Repository mockRepository;
  const owner = 'hmmunioz';
  const repo = 'fulltimeForceTest';

  setUp(() {
    mockRepository = MockRepository();
    commitsBloc = commit_bloc.Bloc(repository: mockRepository);
  });

  group('commit_bloc.Bloc', () {
    blocTest<commit_bloc.Bloc, commit_bloc.State>(
      'emits [LoadingCommitsState, LoadedCommitsState] when GetCommitsEvent is added and repository fetches successfully',
      build: () {
        when(() => mockRepository.fetchCommits(
              owner,
              repo,
              page: 0,
              size: 10,
            )).thenAnswer(
          (_) async => <ResponseCommitModel>[],
        );
        return commitsBloc;
      },
      act: (bloc) => bloc.add(const commit_bloc.GetCommitsEvent(owner, repo)),
      expect: () => [
        isA<commit_bloc.LoadingCommitsState>(),
        isA<commit_bloc.LoadedCommitsState>(),
      ],
    );

    blocTest<commit_bloc.Bloc, commit_bloc.State>(
      'emits [LoadingCommitsState, LoadedCommitsState] when GetMoreCommitsEvent is added and repository fetches successfully',
      build: () {
        when(() => mockRepository.fetchCommits(
              owner,
              repo,
              page: 2,
              size: 10,
            )).thenAnswer(
          (_) async => <ResponseCommitModel>[],
        );
        return commitsBloc;
      },
      act: (bloc) => bloc.add(commit_bloc.GetMoreCommitsEvent()),
      expect: () => [
        isA<commit_bloc.LoadingCommitsState>(),
        isA<commit_bloc.LoadedCommitsState>(),
      ],
    );

    blocTest<commit_bloc.Bloc, commit_bloc.State>(
      'emits [LoadingCommitsState, LoadedCommitsState] when ReloadCommitsEvent is added and repository fetches successfully',
      build: () {
        when(() => mockRepository.fetchCommits(
              owner,
              repo,
              page: 0,
              size: 10,
            )).thenAnswer(
          (_) async => <ResponseCommitModel>[],
        );
        return commitsBloc;
      },
      act: (bloc) => bloc.add(commit_bloc.ReloadCommitsEvent()),
      expect: () => [
        isA<commit_bloc.LoadingCommitsState>(),
        isA<commit_bloc.LoadedCommitsState>(),
      ],
    );

    tearDown(() {
      commitsBloc.close();
    });
  });
}

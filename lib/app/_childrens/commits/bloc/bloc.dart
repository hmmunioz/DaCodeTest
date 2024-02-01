import 'package:bloc/bloc.dart' as bloc;
import 'package:fulltimeforce_test/app/models/response_commit_model.dart';
import 'package:fulltimeforce_test/app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc({Repository? repository})
      : repository = repository ??= Repository(),
        super(const InitialState(Model())) {
    on<GetCommitsEvent>(_onGetCommitsEvent);
    on<GetMoreCommitsEvent>(_onGetMoreCommitsEvent);
    on<ReloadCommitsEvent>(_onReloadCommitsEvent);
  }

  late Repository repository;

  Future<Model> _getCommits({
    String owner = ConstantsValues.owner,
    String repo = ConstantsValues.repo,
  }) async {
    final oldCommits = state.model.commits;
    List<ResponseCommitModel> commitsList = [];
    if ((state.model.limit * (state.model.page)) < state.model.total ||
        state.model.total == 0) {
      final response = await repository.fetchCommits(
        owner,
        repo,
        page: state.model.page,
        size: state.model.limit,
      );

      if (response.isEmpty) {
        return state.model.copyWith(
          commits: state.model.commits,
          total: 100,
          limit: state.model.limit,
          page: state.model.page + 1,
          isLast: oldCommits!.isEmpty ? false : true,
        );
      } else {
        commitsList = [...oldCommits ?? [], ...response];

        return state.model.copyWith(
          commits: commitsList,
          total: 100,
          limit: state.model.limit,
          page: state.model.page + 1,
          isLast: false,
        );
      }
    }
    return state.model;
  }

  void _onGetCommitsEvent(
    GetCommitsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingCommitsState(state.model));
    try {
      final model = await _getCommits(
        owner: event.owner,
        repo: event.repo,
      );
      emit(LoadedCommitsState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onGetMoreCommitsEvent(
    GetMoreCommitsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingCommitsState(state.model));
    try {
      final model = await _getCommits();
      emit(LoadedCommitsState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }

  void _onReloadCommitsEvent(
    ReloadCommitsEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingCommitsState(state.model.copyWith(
      commits: [],
      page: 0,
      limit: 5,
    )));
    try {
      final model = await _getCommits();

      emit(LoadedCommitsState(model));
    } catch (error) {
      emit(ErrorState(state.model));
    }
  }
}

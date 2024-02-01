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

class LoadingCommitsState extends State {
  const LoadingCommitsState(Model model) : super(model);
}

class LoadedCommitsState extends State {
  const LoadedCommitsState(Model model) : super(model);
}

class ErrorState extends State {
  const ErrorState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.commits,
    this.limit = 5,
    this.page = 0,
    this.total = 100,
    this.isLast = false,
  });
  final int limit;
  final int page;
  final int total;
  final bool isLast;
  final List<ResponseCommitModel>? commits;

  Model copyWith({
    int? limit,
    int? page,
    int? total,
    bool? isLast,
    List<ResponseCommitModel>? commits,
  }) {
    return Model(
      commits: commits ?? this.commits,
      page: page ?? this.page,
      total: total ?? this.total,
      isLast: isLast ?? this.isLast,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [
        commits,
        page,
        total,
        isLast,
        limit,
      ];
}

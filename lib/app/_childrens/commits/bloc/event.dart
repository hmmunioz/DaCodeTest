part of 'bloc.dart';

abstract class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

class GetCommitsEvent extends Event {
  final String owner;
  final String repo;

  const GetCommitsEvent(
    this.owner,
    this.repo,
  );
}

class ReloadCommitsEvent extends Event {}

class GetMoreCommitsEvent extends Event {}

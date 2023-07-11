part of 'inbox_bloc.dart';

@immutable
abstract class InboxState {}

class InboxInitial extends InboxState {}

class InboxLoadingState extends InboxState {}

class InboxLoadedState extends InboxState {
  final List<InboxMessage> messages;

  InboxLoadedState({required this.messages});
}

class InboxErrorState extends InboxState {
  final String error;

  InboxErrorState({required this.error});
}

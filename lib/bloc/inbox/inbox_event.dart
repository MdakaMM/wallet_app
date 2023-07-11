part of 'inbox_bloc.dart';

@immutable
abstract class InboxEvent {}

class FetchInboxMessagesEvent extends InboxEvent {}
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxMessage {
  final String description;
  final DateTime date;

  InboxMessage({required this.description, required this.date});
}

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  InboxBloc() : super(InboxLoadingState());

  @override
  Stream<InboxState> mapEventToState(InboxEvent event) async* {
    if (event is FetchInboxMessagesEvent) {
      yield* _mapFetchInboxMessagesEventToState();
    }
  }

  Stream<InboxState> _mapFetchInboxMessagesEventToState() async* {
    yield InboxLoadingState();

    try {
      final messagesJson =
          await rootBundle.loadString('assets/json/messages.json');
      final List<dynamic> messagesData = json.decode(messagesJson);

      final List<InboxMessage> messages = messagesData
          .map((data) => InboxMessage(
                description: data['description'],
                date: DateTime.parse(data['date']),
              ))
          .toList();

      messages.sort((a, b) => b.date.compareTo(a.date));

      yield InboxLoadedState(messages: messages);
    } catch (e) {
      yield InboxErrorState(error: 'Failed to load inbox messages.');
    }
  }
}

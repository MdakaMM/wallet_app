import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/transaction_model.dart';

class TransactionBloc extends Cubit<List<Transaction>> {
  TransactionBloc() : super([]);

  Future<void> loadTransactions() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/transactions.json');
      final transactions = transactionsFromJson(jsonString);
      emit(transactions);
    } catch (e) {
      // Handle error loading transactions
      print('Error loading transactions: $e');
    }
  }
}

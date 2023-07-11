import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

enum TransactionType {
  @JsonValue('NETFLIX')
  netflix,
  @JsonValue('PAYPAL')
  paypal,
  @JsonValue('GENERAL')
  general,
}

@JsonSerializable()
class Transaction {
  final String icon;
  final String subtitle;
  final int amount;
  final TransactionType type;

  Transaction({
    required this.icon,
    required this.subtitle,
    required this.amount,
    required this.type,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

List<Transaction> transactionsFromJson(String jsonString) {
  final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<Transaction>((json) => Transaction.fromJson(json)).toList();
}

String transactionsToJson(List<Transaction> transactions) {
  return jsonEncode(
      transactions.map((transaction) => transaction.toJson()).toList());
}

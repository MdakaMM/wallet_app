// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      icon: json['icon'] as String,
      subtitle: json['subtitle'] as String,
      amount: json['amount'] as int,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'subtitle': instance.subtitle,
      'amount': instance.amount,
      'type': _$TransactionTypeEnumMap[instance.type]!,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.netflix: 'NETFLIX',
  TransactionType.paypal: 'PAYPAL',
  TransactionType.general: 'GENERAL',
};

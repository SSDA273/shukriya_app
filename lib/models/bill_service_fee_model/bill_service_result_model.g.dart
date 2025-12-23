// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_service_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillServiceResultModel _$BillServiceResultModelFromJson(
        Map<String, dynamic> json) =>
    BillServiceResultModel(
      totalFee: (json['total_fee'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      totalAmount: (json['total_amount'] as num?)?.toDouble(),
      feeStructure: (json['fee_structure'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$BillServiceResultModelToJson(
        BillServiceResultModel instance) =>
    <String, dynamic>{
      'total_fee': instance.totalFee,
      'amount': instance.amount,
      'total_amount': instance.totalAmount,
      'fee_structure': instance.feeStructure,
    };

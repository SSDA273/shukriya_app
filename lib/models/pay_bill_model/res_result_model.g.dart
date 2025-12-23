// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResResultModel _$ResResultModelFromJson(Map<String, dynamic> json) =>
    ResResultModel(
      referenceNumber: json['reference_number'] as String,
      payBillId: json['pay_bill_id'] as String,
      statusDescription: json['status_description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ResResultModelToJson(ResResultModel instance) =>
    <String, dynamic>{
      'reference_number': instance.referenceNumber,
      'pay_bill_id': instance.payBillId,
      'status_description': instance.statusDescription,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

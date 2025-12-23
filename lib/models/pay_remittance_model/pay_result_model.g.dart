// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayResultModel _$PayResultModelFromJson(Map<String, dynamic> json) =>
    PayResultModel(
      referenceNumber: json['reference_number'] as String,
      paymentId: json['payment_id'] as String,
      receivesAt: json['receives_by'] == null
          ? null
          : DateTime.parse(json['receives_by'] as String),
      statusDescription: json['status_description'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PayResultModelToJson(PayResultModel instance) =>
    <String, dynamic>{
      'reference_number': instance.referenceNumber,
      'payment_id': instance.paymentId,
      'status_description': instance.statusDescription,
      'created_at': instance.createdAt.toIso8601String(),
      'receives_by': instance.receivesAt?.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

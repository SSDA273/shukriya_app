// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPResultModel _$OTPResultModelFromJson(Map<String, dynamic> json) =>
    OTPResultModel(
      referenceNumber: json['Reference_number'] as String,
      statusDescription: json['status_description'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OTPResultModelToJson(OTPResultModel instance) =>
    <String, dynamic>{
      'Reference_number': instance.referenceNumber,
      'status_description': instance.statusDescription,
      'updated_at': instance.updatedAt.toIso8601String(),
    };

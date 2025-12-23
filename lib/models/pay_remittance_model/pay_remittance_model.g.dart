// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_remittance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayRemittanceModel _$PayRemittanceModelFromJson(Map<String, dynamic> json) =>
    PayRemittanceModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : PayResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayRemittanceModelToJson(PayRemittanceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

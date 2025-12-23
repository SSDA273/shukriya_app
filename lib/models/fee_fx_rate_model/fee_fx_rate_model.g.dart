// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_fx_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeeFxRateModel _$FeeFxRateModelFromJson(Map<String, dynamic> json) =>
    FeeFxRateModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : RateResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeeFxRateModelToJson(FeeFxRateModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

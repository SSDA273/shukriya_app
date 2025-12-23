// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeHouseModel _$ExchangeHouseModelFromJson(Map<String, dynamic> json) =>
    ExchangeHouseModel(
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ExchangeResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$ExchangeHouseModelToJson(ExchangeHouseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'statusCode': instance.statusCode,
    };

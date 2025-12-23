// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateResultModel _$RateResultModelFromJson(Map<String, dynamic> json) =>
    RateResultModel(
      rate: json['rate'] as num,
      fee: json['fee'] as num,
      sendAmount: json['send_amount'] as num,
    );

Map<String, dynamic> _$RateResultModelToJson(RateResultModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'fee': instance.fee,
      'send_amount': instance.sendAmount,
    };

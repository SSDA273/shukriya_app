// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_tier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeeTierModel _$FeeTierModelFromJson(Map<String, dynamic> json) => FeeTierModel(
      fee: json['fee'] as num?,
      from: json['from'] as num?,
      to: json['to'] as num?,
    );

Map<String, dynamic> _$FeeTierModelToJson(FeeTierModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'fee': instance.fee,
    };

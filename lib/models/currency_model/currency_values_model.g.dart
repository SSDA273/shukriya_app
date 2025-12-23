// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_values_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyValuesModel _$CurrencyValuesModelFromJson(Map<String, dynamic> json) =>
    CurrencyValuesModel(
      countryId: json['countryId'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      currencyCode: json['currencyCode'] as String?,
      countryFlag: json['countryFlag'] as String?,
    );

Map<String, dynamic> _$CurrencyValuesModelToJson(
        CurrencyValuesModel instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'currencyCode': instance.currencyCode,
      'countryFlag': instance.countryFlag,
    };

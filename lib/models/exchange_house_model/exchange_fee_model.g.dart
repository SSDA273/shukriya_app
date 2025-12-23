// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_fee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeFeeModel _$ExchangeFeeModelFromJson(Map<String, dynamic> json) =>
    ExchangeFeeModel(
      id: json['_id'] as String?,
      entityId: json['entity_id'] as String?,
      entityKey: json['entity_key'] as String?,
      serviceId: json['service_id'] as String?,
      fromCurrency: json['from_currency'] as String?,
      toCurrency: json['to_currency'] as String?,
      feeMin: json['fee_min'] as num?,
      feeMax: json['fee_max'] as num?,
      feePercentage: json['fee_percentage'] as num?,
      feeFlat: json['fee_flat'] as num?,
      feeCurrency: json['fee_currency'] as String?,
      fxRate: json['fx_rate'] as num?,
      feeTier: (json['fee_tier'] as List<dynamic>?)
          ?.map((e) => FeeTierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rateValidity: json['rate_validity'] as num?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ExchangeFeeModelToJson(ExchangeFeeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'entity_id': instance.entityId,
      'entity_key': instance.entityKey,
      'service_id': instance.serviceId,
      'from_currency': instance.fromCurrency,
      'to_currency': instance.toCurrency,
      'fee_min': instance.feeMin,
      'fee_max': instance.feeMax,
      'fee_percentage': instance.feePercentage,
      'fee_flat': instance.feeFlat,
      'fee_tier': instance.feeTier,
      'fee_currency': instance.feeCurrency,
      'fx_rate': instance.fxRate,
      'rate_validity': instance.rateValidity,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

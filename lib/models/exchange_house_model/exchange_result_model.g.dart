// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeResultModel _$ExchangeResultModelFromJson(Map<String, dynamic> json) =>
    ExchangeResultModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      descriptions: json['descriptions'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ExchangeProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExchangeResultModelToJson(
        ExchangeResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'products': instance.products?.map((e) => e.toJson()).toList(),
    };

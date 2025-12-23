// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers_configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillersConfigurationModel _$BillersConfigurationModelFromJson(
        Map<String, dynamic> json) =>
    BillersConfigurationModel(
      shortcode: json['shortcode'] as String?,
      params: (json['params'] as List<dynamic>?)
          ?.map((e) => BillersParamsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillersConfigurationModelToJson(
        BillersConfigurationModel instance) =>
    <String, dynamic>{
      'shortcode': instance.shortcode,
      'params': instance.params?.map((e) => e.toJson()).toList(),
    };

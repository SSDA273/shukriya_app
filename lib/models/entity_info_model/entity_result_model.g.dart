// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityResultModel _$EntityResultModelFromJson(Map<String, dynamic> json) =>
    EntityResultModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      legalName: json['legal_name'] as String?,
      branding: (json['branding'] as List<dynamic>?)
          ?.map((e) => EntityBrandingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homeCurrency: json['home_currency'] as String?,
    );

Map<String, dynamic> _$EntityResultModelToJson(EntityResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'legal_name': instance.legalName,
      'logo': instance.logo,
      'branding': instance.branding?.map((e) => e.toJson()).toList(),
      'home_currency': instance.homeCurrency,
    };

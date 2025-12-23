// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillResultModel _$BillResultModelFromJson(Map<String, dynamic> json) =>
    BillResultModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      descriptions: json['descriptions'] as String?,
      logo: json['logo'] as String?,
      branding: json['branding'] == null
          ? null
          : BillBrandingModel.fromJson(
              json['branding'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => BillProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillResultModelToJson(BillResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'logo': instance.logo,
      'branding': instance.branding?.toJson(),
      'products': instance.products?.map((e) => e.toJson()).toList(),
    };

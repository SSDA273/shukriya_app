// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillersProductModel _$BillersProductModelFromJson(Map<String, dynamic> json) =>
    BillersProductModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      configurations: json['configurations'] == null
          ? null
          : BillersConfigurationModel.fromJson(
              json['configurations'] as Map<String, dynamic>),
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$BillersProductModelToJson(
        BillersProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'configurations': instance.configurations?.toJson(),
      'logo': instance.logo,
    };

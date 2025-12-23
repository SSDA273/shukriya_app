// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularProductModel _$PopularProductModelFromJson(Map<String, dynamic> json) =>
    PopularProductModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$PopularProductModelToJson(
        PopularProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'logo': instance.logo,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubProductModel _$SubProductModelFromJson(Map<String, dynamic> json) =>
    SubProductModel(
      id: json['_id'] as String,
      productName: json['name'] as String,
      productLogo: json['logo'] as String,
    );

Map<String, dynamic> _$SubProductModelToJson(SubProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.productName,
      'logo': instance.productLogo,
    };

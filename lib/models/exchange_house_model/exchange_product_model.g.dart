// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeProductModel _$ExchangeProductModelFromJson(
        Map<String, dynamic> json) =>
    ExchangeProductModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      code: json['code'] as String?,
      hsnCode: json['hsnCode'] as String?,
      isActive: json['isActive'] as bool?,
      isVerified: json['isVerified'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      serviceSubCategoryId: json['service_sub_category_id'] as String?,
      serviceCategoryId: json['service_category_id'] as String?,
      fee: json['fee'] == null
          ? null
          : ExchangeFeeModel.fromJson(json['fee'] as Map<String, dynamic>),
      serviceId: json['serviceid'] as String?,
    );

Map<String, dynamic> _$ExchangeProductModelToJson(
        ExchangeProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'code': instance.code,
      'hsnCode': instance.hsnCode,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'service_sub_category_id': instance.serviceSubCategoryId,
      'service_category_id': instance.serviceCategoryId,
      'fee': instance.fee?.toJson(),
      'serviceid': instance.serviceId,
    };

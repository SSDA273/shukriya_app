// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillProductModel _$BillProductModelFromJson(Map<String, dynamic> json) =>
    BillProductModel(
      id: json['_id'] as String?,
      configurations: json['configurations'] == null
          ? null
          : BillConfigurationModel.fromJson(
              json['configurations'] as Map<String, dynamic>),
      name: json['name'] as String?,
      code: json['code'] as String?,
      serviceId: json['service_id'] as String?,
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
      v: (json['__v'] as num?)?.toInt(),
      serviceSubCategoryId: json['service_sub_category_id'] as String?,
      serviceCategoryId: json['service_category_id'] as String?,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BillProductModelToJson(BillProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'hsnCode': instance.hsnCode,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'service_sub_category_id': instance.serviceSubCategoryId,
      'service_category_id': instance.serviceCategoryId,
      'service_id': instance.serviceId,
      'logo': instance.logo,
      'description': instance.description,
      'configurations': instance.configurations?.toJson(),
    };

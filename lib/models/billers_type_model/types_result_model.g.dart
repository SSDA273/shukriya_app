// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeResultModel _$TypeResultModelFromJson(Map<String, dynamic> json) =>
    TypeResultModel(
      id: json['_id'] as String,
      typeName: json['biller_type_name'] as String,
      typeCode: json['biller_type_code'] as String,
      isActive: json['isActive'] as bool,
      isDeleted: json['isDeleted'] as bool,
      isVerified: json['isVerified'] as bool,
    );

Map<String, dynamic> _$TypeResultModelToJson(TypeResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'biller_type_name': instance.typeName,
      'biller_type_code': instance.typeCode,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
      'isDeleted': instance.isDeleted,
    };

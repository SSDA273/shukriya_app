// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityInfoModel _$EntityInfoModelFromJson(Map<String, dynamic> json) =>
    EntityInfoModel(
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : EntityResultModel.fromJson(json['result'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$EntityInfoModelToJson(EntityInfoModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

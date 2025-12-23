// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_recent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubRecentModel _$SubRecentModelFromJson(Map<String, dynamic> json) =>
    SubRecentModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : SubRecentResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubRecentModelToJson(SubRecentModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsModel _$ColorsModelFromJson(Map<String, dynamic> json) => ColorsModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : ColorsResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ColorsModelToJson(ColorsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

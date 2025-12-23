// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayResponseModel _$PayResponseModelFromJson(Map<String, dynamic> json) =>
    PayResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : ResResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayResponseModelToJson(PayResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

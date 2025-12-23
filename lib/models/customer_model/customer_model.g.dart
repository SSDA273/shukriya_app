// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : ResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

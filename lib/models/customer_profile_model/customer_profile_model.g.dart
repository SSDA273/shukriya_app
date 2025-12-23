// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerProfileModel _$CustomerProfileModelFromJson(
        Map<String, dynamic> json) =>
    CustomerProfileModel(
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : CustomerResultModel.fromJson(
              json['result'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$CustomerProfileModelToJson(
        CustomerProfileModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

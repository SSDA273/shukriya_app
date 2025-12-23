// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPResponseModel _$OTPResponseModelFromJson(Map<String, dynamic> json) =>
    OTPResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : OTPResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OTPResponseModelToJson(OTPResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

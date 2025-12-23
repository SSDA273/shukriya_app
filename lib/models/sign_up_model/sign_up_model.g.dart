// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : SignUpResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

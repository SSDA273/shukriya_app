// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResultModel _$SignUpResultModelFromJson(Map<String, dynamic> json) =>
    SignUpResultModel(
      mobileNumber: json['mobileNumber'] as String,
      customData: json['customer_data'],
    );

Map<String, dynamic> _$SignUpResultModelToJson(SignUpResultModel instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'customer_data': instance.customData,
    };

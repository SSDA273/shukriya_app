// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailsModel _$AccountDetailsModelFromJson(Map<String, dynamic> json) =>
    AccountDetailsModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : AccountResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountDetailsModelToJson(
        AccountDetailsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillersTypeModel _$BillersTypeModelFromJson(Map<String, dynamic> json) =>
    BillersTypeModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
    )..result = (json['result'] as List<dynamic>?)
        ?.map((e) => TypeResultModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$BillersTypeModelToJson(BillersTypeModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'result': instance.result?.map((e) => e.toJson()).toList(),
    };

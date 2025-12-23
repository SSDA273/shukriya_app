// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_bills_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularBillsModel _$PopularBillsModelFromJson(Map<String, dynamic> json) =>
    PopularBillsModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => PopularResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularBillsModelToJson(PopularBillsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'statusCode': instance.statusCode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_service_fee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillServiceFeeModel _$BillServiceFeeModelFromJson(Map<String, dynamic> json) =>
    BillServiceFeeModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : BillServiceResultModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillServiceFeeModelToJson(
        BillServiceFeeModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'result': instance.result?.toJson(),
    };

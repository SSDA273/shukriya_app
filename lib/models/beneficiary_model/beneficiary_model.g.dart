// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeneficiaryModel _$BeneficiaryModelFromJson(Map<String, dynamic> json) =>
    BeneficiaryModel(
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>?)
          ?.map(
              (e) => BeneficiaryResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$BeneficiaryModelToJson(BeneficiaryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'statusCode': instance.statusCode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_image_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeneficiaryImageUploadModel _$BeneficiaryImageUploadModelFromJson(
        Map<String, dynamic> json) =>
    BeneficiaryImageUploadModel(
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : BeneficiaryImageResultModel.fromJson(
              json['result'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$BeneficiaryImageUploadModelToJson(
        BeneficiaryImageUploadModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.toJson(),
      'statusCode': instance.statusCode,
    };

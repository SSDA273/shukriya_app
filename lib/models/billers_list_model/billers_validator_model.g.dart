// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers_validator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillersValidateModel _$BillersValidateModelFromJson(
        Map<String, dynamic> json) =>
    BillersValidateModel(
      required: json['required'] as bool?,
      maxLength: (json['maxLength'] as num?)?.toInt(),
      minLength: (json['minLength'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BillersValidateModelToJson(
        BillersValidateModel instance) =>
    <String, dynamic>{
      'required': instance.required,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
    };

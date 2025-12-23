// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillersParamsModel _$BillersParamsModelFromJson(Map<String, dynamic> json) =>
    BillersParamsModel(
      label: json['label'] as String?,
      text: json['text'] as String?,
      key: json['key'] as String?,
      type: json['type'] as String?,
      validate: json['validate'] == null
          ? null
          : BillersValidateModel.fromJson(
              json['validate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillersParamsModelToJson(BillersParamsModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'text': instance.text,
      'key': instance.key,
      'type': instance.type,
      'validate': instance.validate?.toJson(),
    };

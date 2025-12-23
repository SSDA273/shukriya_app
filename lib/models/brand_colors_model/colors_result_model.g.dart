// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsResultModel _$ColorsResultModelFromJson(Map<String, dynamic> json) =>
    ColorsResultModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      branding: (json['branding'] as List<dynamic>)
          .map((e) => ColorsBrandingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ColorsResultModelToJson(ColorsResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'branding': instance.branding.map((e) => e.toJson()).toList(),
    };

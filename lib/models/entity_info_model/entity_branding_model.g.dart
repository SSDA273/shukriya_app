// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_branding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityBrandingModel _$EntityBrandingModelFromJson(Map<String, dynamic> json) =>
    EntityBrandingModel(
      primary: json['primary'] as String?,
      secondary: json['secondary'] as String?,
      tertiary: json['tertiary'] as String?,
      fontStyle: json['fontStyle'] as String?,
    );

Map<String, dynamic> _$EntityBrandingModelToJson(
        EntityBrandingModel instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'tertiary': instance.tertiary,
      'fontStyle': instance.fontStyle,
    };

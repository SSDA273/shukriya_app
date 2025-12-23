// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityModel _$EntityModelFromJson(Map<String, dynamic> json) => EntityModel(
      id: json['id'] as String,
      name: json['name'] as String,
      entityKey: json['entityKey'] as String,
    );

Map<String, dynamic> _$EntityModelToJson(EntityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'entityKey': instance.entityKey,
    };

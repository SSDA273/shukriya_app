// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      addressLine: json['addressLine'] as String,
      addressLine2: json['addressLine2'] as String,
      poBox: json['poBox'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'addressLine': instance.addressLine,
      'addressLine2': instance.addressLine2,
      'poBox': instance.poBox,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_billers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubBillersModel _$SubBillersModelFromJson(Map<String, dynamic> json) =>
    SubBillersModel(
      id: json['_id'] as String,
      productId: json['products_id'] as String,
      serviceId: json['service_id'] as String,
      billerTypeId: json['biller_type_id'] as String,
      billerCurrency: json['biller_currency'] as String,
      billerName: json['biller_name'] as String,
      billerNickName: json['biller_nick_name'] as String,
      billerCountryCode: json['biller_country_code'] as String,
      billerAccountName: json['biller_account_name'] as String,
      billerAccountNumber: json['biller_account_number'] as String,
    );

Map<String, dynamic> _$SubBillersModelToJson(SubBillersModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'products_id': instance.productId,
      'service_id': instance.serviceId,
      'biller_type_id': instance.billerTypeId,
      'biller_currency': instance.billerCurrency,
      'biller_name': instance.billerName,
      'biller_nick_name': instance.billerNickName,
      'biller_country_code': instance.billerCountryCode,
      'biller_account_name': instance.billerAccountName,
      'biller_account_number': instance.billerAccountNumber,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularResultModel _$PopularResultModelFromJson(Map<String, dynamic> json) =>
    PopularResultModel(
      id: json['_id'] as String?,
      entityId: json['entity_id'] as String?,
      entityKey: json['entity_key'] as String?,
      customerId: json['customer_id'] as String?,
      serviceID: json['service_id'] as String?,
      billerTypeId: json['biller_type_id'] as String?,
      productId: json['products'] == null
          ? null
          : PopularProductModel.fromJson(
              json['products'] as Map<String, dynamic>),
      billerCurrency: json['biller_currency'] as String?,
      billerName: json['biller_name'] as String?,
      billerNickName: json['biller_nick_name'] as String?,
      billerCity: json['biller_city'] as String?,
      billerCountryCode: json['biller_country_code'] as String?,
      billerAccountName: json['biller_account_name'] as String?,
      billerAccountNumber: json['biller_account_number'] as String?,
      billerDob: json['biller_dob'] == null
          ? null
          : DateTime.parse(json['biller_dob'] as String),
      billerState: json['biller_state'] as String?,
      billerPostCode: json['biller_post_code'] as String?,
    );

Map<String, dynamic> _$PopularResultModelToJson(PopularResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'entity_id': instance.entityId,
      'entity_key': instance.entityKey,
      'customer_id': instance.customerId,
      'biller_type_id': instance.billerTypeId,
      'biller_currency': instance.billerCurrency,
      'biller_name': instance.billerName,
      'biller_nick_name': instance.billerNickName,
      'biller_city': instance.billerCity,
      'biller_country_code': instance.billerCountryCode,
      'biller_account_name': instance.billerAccountName,
      'biller_account_number': instance.billerAccountNumber,
      'biller_dob': instance.billerDob?.toIso8601String(),
      'biller_state': instance.billerState,
      'biller_post_code': instance.billerPostCode,
      'products': instance.productId?.toJson(),
      'service_id': instance.serviceID,
    };

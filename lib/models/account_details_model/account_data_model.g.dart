// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDataModel _$AccountDataModelFromJson(Map<String, dynamic> json) =>
    AccountDataModel(
      accountId: json['account_id'] as String,
      accountName: json['account_name'] as String,
      accountNumberLast4: json['account_number_last4'] as String,
      accountToken: json['account_token'] as String,
      accountTypeId: json['account_type_id'] as String,
      accountBalance: json['account_balance'] as String,
      accountBalanceCurrency: json['account_balance_currency'] as String,
      cardScheme: json['card_scheme'] as String,
      serviceProviderId: json['service_provider_ID'] as String,
      serviceProviderName: json['service_provider_name'] as String,
      expiry: json['expiry'] as String,
      accountStatus: json['account_status'] as String,
      fullfillmentStatus: json['fullfillment_status'] as String,
      linkedMobileNo: json['linked_mobile_no'] as String,
    );

Map<String, dynamic> _$AccountDataModelToJson(AccountDataModel instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'account_name': instance.accountName,
      'account_number_last4': instance.accountNumberLast4,
      'account_token': instance.accountToken,
      'account_type_id': instance.accountTypeId,
      'account_balance': instance.accountBalance,
      'account_balance_currency': instance.accountBalanceCurrency,
      'card_scheme': instance.cardScheme,
      'service_provider_ID': instance.serviceProviderId,
      'service_provider_name': instance.serviceProviderName,
      'expiry': instance.expiry,
      'account_status': instance.accountStatus,
      'fullfillment_status': instance.fullfillmentStatus,
      'linked_mobile_no': instance.linkedMobileNo,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_recent_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubRecentList _$SubRecentListFromJson(Map<String, dynamic> json) =>
    SubRecentList(
      id: json['_id'] as String,
      transactionId: json['transaction_id'] as String,
      customerId: json['customer_id'] as String,
      serviceId: json['service_id'] as String,
      accountId: json['account_id'] as String,
      billerId: json['biller_id'] as String,
      debitAmount: (json['debit_amount'] as num).toInt(),
      debitAmountCurrency: json['debit_amount_currency'] as String,
      totalFee: (json['total_fee'] as num).toInt(),
      paymentType: json['payment_type'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      billers:
          SubBillersModel.fromJson(json['billers'] as Map<String, dynamic>),
      products:
          SubProductModel.fromJson(json['products'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubRecentListToJson(SubRecentList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'transaction_id': instance.transactionId,
      'customer_id': instance.customerId,
      'service_id': instance.serviceId,
      'account_id': instance.accountId,
      'biller_id': instance.billerId,
      'debit_amount_currency': instance.debitAmountCurrency,
      'debit_amount': instance.debitAmount,
      'total_fee': instance.totalFee,
      'payment_type': instance.paymentType,
      'products': instance.products.toJson(),
      'billers': instance.billers.toJson(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

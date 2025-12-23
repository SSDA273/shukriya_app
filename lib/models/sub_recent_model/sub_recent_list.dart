import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/sub_recent_model/sub_billers_model.dart';
import 'package:unitey_app/models/sub_recent_model/sub_product_model.dart';

part 'sub_recent_list.g.dart';

@JsonSerializable(explicitToJson: true)
class SubRecentList {
  @JsonKey(name: '_id') String id;
  @JsonKey(name: 'transaction_id')final String transactionId;
  @JsonKey(name: 'customer_id') final String customerId;
  @JsonKey(name: 'service_id') final String serviceId;
  @JsonKey(name: 'account_id') final  String accountId;
  @JsonKey(name: 'biller_id') final  String billerId;
  @JsonKey(name: 'debit_amount_currency') final  String debitAmountCurrency;
  @JsonKey(name: 'debit_amount') final  int debitAmount;
  @JsonKey(name: 'total_fee') final  int totalFee;
  @JsonKey(name: 'payment_type') final   String paymentType;
  @JsonKey(name: 'products') final   SubProductModel products;
  SubBillersModel billers;
  DateTime updatedAt;
  SubRecentList({
    required this.id,
    required this.transactionId,
    required this.customerId,
    required this.serviceId,
    required this.accountId,
    required this.billerId,
    required this.debitAmount,
    required this.debitAmountCurrency,
    required this.totalFee,
    required this.paymentType,
    required this.updatedAt,
    required this.billers,
    required this.products,
  });

  factory SubRecentList.fromJson(Map<String, dynamic> json) =>
      _$SubRecentListFromJson(json);

  Map<String, dynamic> toJson() => _$SubRecentListToJson(this);
}

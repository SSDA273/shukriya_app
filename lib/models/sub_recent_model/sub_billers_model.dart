import 'package:json_annotation/json_annotation.dart';

part 'sub_billers_model.g.dart';

@JsonSerializable()
class SubBillersModel {
  @JsonKey(name: '_id') String id;
  @JsonKey(name: 'products_id') String productId;
  @JsonKey(name: 'service_id') String serviceId;
  @JsonKey(name: 'biller_type_id') String billerTypeId;
  @JsonKey(name: 'biller_currency') String billerCurrency;
  @JsonKey(name: 'biller_name') String billerName;
  @JsonKey(name: 'biller_nick_name') String billerNickName;
  @JsonKey(name: 'biller_country_code') String billerCountryCode;
  @JsonKey(name: 'biller_account_name') String billerAccountName;
  @JsonKey(name: 'biller_account_number') String billerAccountNumber;

  SubBillersModel({
    required this.id,
    required this.productId,
    required this.serviceId,
    required this.billerTypeId,
    required this.billerCurrency,
    required this.billerName,
    required this.billerNickName,
    required this.billerCountryCode,
    required this.billerAccountName,
    required this.billerAccountNumber,
  });

  factory SubBillersModel.fromJson(Map<String, dynamic> json) =>
      _$SubBillersModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubBillersModelToJson(this);
}

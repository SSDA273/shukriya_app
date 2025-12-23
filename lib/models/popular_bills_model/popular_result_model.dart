import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/popular_bills_model/popular_product_model.dart';

part 'popular_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularResultModel {
  @JsonKey(name: '_id') final String? id;
  @JsonKey(name: 'entity_id') final String? entityId;
  @JsonKey(name: 'entity_key') final String? entityKey;
  @JsonKey(name: 'customer_id') final String? customerId;
  @JsonKey(name: 'biller_type_id') final String? billerTypeId;
  @JsonKey(name: 'biller_currency') final String? billerCurrency;
  @JsonKey(name: 'biller_name') final String? billerName;
  @JsonKey(name: 'biller_nick_name') final String? billerNickName;
  @JsonKey(name: 'biller_city') final String? billerCity;
  @JsonKey(name: 'biller_country_code') final String? billerCountryCode;
  @JsonKey(name: 'biller_account_name') final String? billerAccountName;
  @JsonKey(name: 'biller_account_number') final String? billerAccountNumber;
  @JsonKey(name: 'biller_dob') final DateTime? billerDob;
  @JsonKey(name: 'biller_state') final String? billerState;
  @JsonKey(name: 'biller_post_code') final String? billerPostCode;
  @JsonKey(name: 'products') final PopularProductModel? productId;
  @JsonKey(name: 'service_id') final String? serviceID;

  PopularResultModel({
    this.id,
    this.entityId,
    this.entityKey,
    this.customerId,
    this.serviceID,
    this.billerTypeId,
    this.productId,
    this.billerCurrency,
    this.billerName,
    this.billerNickName,
    this.billerCity,
    this.billerCountryCode,
    this.billerAccountName,
    this.billerAccountNumber,
    this.billerDob,
    this.billerState,
    this.billerPostCode,
  });

  factory PopularResultModel.fromJson(Map<String, dynamic> json) =>
      _$PopularResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularResultModelToJson(this);
}

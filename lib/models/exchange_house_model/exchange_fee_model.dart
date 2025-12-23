import 'package:json_annotation/json_annotation.dart';

import 'fee_tier_model.dart';


part 'exchange_fee_model.g.dart';

@JsonSerializable()
class ExchangeFeeModel {
  @JsonKey(name: "_id") final String? id;
  @JsonKey(name: "entity_id") final String? entityId;
  @JsonKey(name: "entity_key") final String? entityKey;
  @JsonKey(name: "service_id") final String? serviceId;
  @JsonKey(name: "from_currency") final String? fromCurrency;
  @JsonKey(name: "to_currency") final String? toCurrency;
  @JsonKey(name: "fee_min") final num? feeMin;
  @JsonKey(name: "fee_max") final num? feeMax;
  @JsonKey(name: "fee_percentage") final num? feePercentage;
  @JsonKey(name: "fee_flat") final num? feeFlat;
  @JsonKey(name: "fee_tier") final List<FeeTierModel>? feeTier;
  @JsonKey(name: "fee_currency") final String? feeCurrency;
  @JsonKey(name: "fx_rate") final num? fxRate;
  @JsonKey(name: "rate_validity") final num? rateValidity;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  ExchangeFeeModel({   this.id,
    this.entityId,
    this.entityKey,
    this.serviceId,
    this.fromCurrency,
    this.toCurrency,
    this.feeMin,
    this.feeMax,
    this.feePercentage,
    this.feeFlat,
    this.feeCurrency,
    this.fxRate,
    this.feeTier,
    this.rateValidity,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory ExchangeFeeModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeFeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeFeeModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'exchange_fee_model.dart';


part 'exchange_product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExchangeProductModel {
  @JsonKey(name: "_id") final String? id;
  final String? name;
  final String? logo;
  final String? code;
  final String? hsnCode;
  final bool? isActive;
  final bool? isVerified;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: "service_sub_category_id") final String? serviceSubCategoryId;
  @JsonKey(name: "service_category_id") final String? serviceCategoryId;
  final ExchangeFeeModel? fee;
  @JsonKey(name: "serviceid") final String? serviceId;


  ExchangeProductModel({ this.id,
    this.name,
    this.logo,
    this.code,
    this.hsnCode,
    this.isActive,
    this.isVerified,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.serviceSubCategoryId,
    this.serviceCategoryId,
    this.fee,
    this.serviceId,});

  factory ExchangeProductModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeProductModelToJson(this);
}

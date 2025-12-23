import 'package:json_annotation/json_annotation.dart';

import 'bill_configuration_model.dart';


part 'bill_product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillProductModel {
  @JsonKey(name: '_id') final String? id;
  final String? name;
  final String? code;
  final String? hsnCode;
  final bool? isActive;
  final bool? isVerified;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v') final int? v;
  @JsonKey(name: 'service_sub_category_id')  final String? serviceSubCategoryId;
  @JsonKey(name: 'service_category_id') final String? serviceCategoryId;
  @JsonKey(name: 'service_id') final String? serviceId;
  final String? logo;
  final String? description;
  final BillConfigurationModel? configurations;

  BillProductModel({
    this.id,
    this.configurations,
    this.name,
    this.code,
    this.serviceId,
    this.hsnCode,
    this.isActive,
    this.isVerified,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.serviceSubCategoryId,
    this.serviceCategoryId,
    this.logo,
    this.description,
});

  factory BillProductModel.fromJson(Map<String, dynamic> json) =>
      _$BillProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillProductModelToJson(this);
}

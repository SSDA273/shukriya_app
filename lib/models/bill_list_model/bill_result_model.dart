import 'package:json_annotation/json_annotation.dart';

import 'bill_branding_model.dart';
import 'bill_product_model.dart';

part 'bill_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillResultModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? descriptions;
  final String? logo;
  final BillBrandingModel? branding;
  final List<BillProductModel>? products;

  BillResultModel({
     this.id,
    this.name,
    this.descriptions,
    this.logo,
    this.branding,
    this.products,
  });

  factory BillResultModel.fromJson(Map<String, dynamic> json) =>
      _$BillResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillResultModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'billers_configuration_model.dart';

part 'billers_product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillersProductModel {
  @JsonKey(name: '_id') final String? id;
  final String? name;
  final BillersConfigurationModel? configurations;
  final String? logo;

  BillersProductModel({
    this.id,
    this.name,
    this.configurations,
    this.logo,
  });

  factory BillersProductModel.fromJson(Map<String, dynamic> json) =>
      _$BillersProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersProductModelToJson(this);
}

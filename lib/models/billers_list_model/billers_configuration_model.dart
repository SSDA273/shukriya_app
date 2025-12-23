import 'package:json_annotation/json_annotation.dart';
import 'billers_params_model.dart';

part 'billers_configuration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillersConfigurationModel {
  final String? shortcode;
  final List<BillersParamsModel>? params;

  BillersConfigurationModel({
    this.shortcode,
    this.params
  });

  factory BillersConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$BillersConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersConfigurationModelToJson(this);
}

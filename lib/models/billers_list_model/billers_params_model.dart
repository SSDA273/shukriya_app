import 'package:json_annotation/json_annotation.dart';

import 'billers_validator_model.dart';

part 'billers_params_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillersParamsModel {
  final String? label;
  final String? text;
  final String? key;
  final String? type;
  final BillersValidateModel? validate;

  BillersParamsModel({
    this.label,
    this.text,
    this.key,
    this.type,
    this.validate
  });

  factory BillersParamsModel.fromJson(Map<String, dynamic> json) =>
      _$BillersParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersParamsModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'billers_validator_model.g.dart';

@JsonSerializable()
class BillersValidateModel {
  final bool? required;
  final int? minLength;
  final int? maxLength;

  BillersValidateModel({
    this.required,
    this.maxLength,
    this.minLength
  });

  factory BillersValidateModel.fromJson(Map<String, dynamic> json) =>
      _$BillersValidateModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersValidateModelToJson(this);
}

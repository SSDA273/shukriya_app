import 'package:json_annotation/json_annotation.dart';

part 'currency_values_model.g.dart';

@JsonSerializable()
class CurrencyValuesModel {
  final String? countryId;
  final String? countryCode;
  final String? countryName;
  final String? currencyCode;
  final String? countryFlag;

  CurrencyValuesModel({
    this.countryId,
    this.countryCode,
    this.countryName,
    this.currencyCode,
    this.countryFlag,});

  factory CurrencyValuesModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyValuesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyValuesModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'currency_values_model.dart';

part 'currency_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrencyListModel {
  final String message;
  final  List<CurrencyValuesModel>? result;

  CurrencyListModel({required this.message, this.result});

  factory CurrencyListModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyListModelToJson(this);
}

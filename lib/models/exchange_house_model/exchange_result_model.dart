import 'package:json_annotation/json_annotation.dart';

import 'exchange_product_model.dart';


part 'exchange_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExchangeResultModel {
  @JsonKey(name: "_id") final String? id;
  final String? name;
  final String? descriptions;
  final List<ExchangeProductModel>? products;

  ExchangeResultModel({ this.id,
    this.name,
    this.descriptions,
    this.products,});

  factory ExchangeResultModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeResultModelToJson(this);
}

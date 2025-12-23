import 'package:json_annotation/json_annotation.dart';

import 'exchange_result_model.dart';


part 'exchange_house_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExchangeHouseModel {
  final String message;
  final List<ExchangeResultModel>? result;
  final int statusCode;

  ExchangeHouseModel({required this.message, this.result,required this.statusCode});

  factory ExchangeHouseModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeHouseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeHouseModelToJson(this);
}

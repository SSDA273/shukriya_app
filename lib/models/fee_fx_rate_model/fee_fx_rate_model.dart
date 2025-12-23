import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/fee_fx_rate_model/rate_result_model.dart';

part 'fee_fx_rate_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FeeFxRateModel {
  final String message;
  final RateResultModel? result;
  final int statusCode;

  FeeFxRateModel({required this.statusCode,required this.message,required this.result});

  factory FeeFxRateModel.fromJson(Map<String, dynamic> json) =>
      _$FeeFxRateModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeeFxRateModelToJson(this);
}

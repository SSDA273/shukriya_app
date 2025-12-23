import 'package:json_annotation/json_annotation.dart';

part 'rate_result_model.g.dart';

@JsonSerializable()
class RateResultModel {
  final num rate;
  final num fee;
  @JsonKey(name: "send_amount") final num sendAmount;

  RateResultModel({required this.rate,required this.fee,required this.sendAmount});

  factory RateResultModel.fromJson(Map<String, dynamic> json) =>
      _$RateResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateResultModelToJson(this);
}

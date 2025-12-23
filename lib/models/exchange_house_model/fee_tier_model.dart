import 'package:json_annotation/json_annotation.dart';



part 'fee_tier_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FeeTierModel {
  final num? from;
  final num? to;
  final num? fee;

  FeeTierModel({
     this.fee, this.from, this.to});

  factory FeeTierModel.fromJson(Map<String, dynamic> json) =>
      _$FeeTierModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeeTierModelToJson(this);
}

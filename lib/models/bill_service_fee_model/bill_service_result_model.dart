import 'package:json_annotation/json_annotation.dart';



part 'bill_service_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillServiceResultModel {
  @JsonKey(name: "total_fee") final double? totalFee;
  final double? amount;
  @JsonKey(name: "total_amount") final double? totalAmount;
  @JsonKey(name: "fee_structure") final List<Map<String, dynamic>>? feeStructure;

  BillServiceResultModel({
    this.totalFee,
    this.amount,
    this.totalAmount,
    this.feeStructure,});

  factory BillServiceResultModel.fromJson(Map<String, dynamic> json) =>
      _$BillServiceResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillServiceResultModelToJson(this);
}

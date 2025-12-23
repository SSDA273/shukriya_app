import 'package:json_annotation/json_annotation.dart';

import 'bill_service_result_model.dart';


part 'bill_service_fee_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillServiceFeeModel {
  final int statusCode;
  final String message;
 final BillServiceResultModel? result;

  BillServiceFeeModel({required this.statusCode,required this.message,required this.result});

  factory BillServiceFeeModel.fromJson(Map<String, dynamic> json) =>
      _$BillServiceFeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillServiceFeeModelToJson(this);
}

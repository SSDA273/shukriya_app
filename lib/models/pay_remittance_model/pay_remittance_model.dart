import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/pay_remittance_model/pay_result_model.dart';

part 'pay_remittance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayRemittanceModel {
  final String message;
  final PayResultModel? result;
  final int statusCode;

  PayRemittanceModel({required this.statusCode,required this.message,required this.result});

  factory PayRemittanceModel.fromJson(Map<String, dynamic> json) =>
      _$PayRemittanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayRemittanceModelToJson(this);
}

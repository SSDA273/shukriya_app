import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/pay_bill_model/res_result_model.dart';

part 'pay_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayResponseModel {
  final String message;
  final ResResultModel? result;
  final int statusCode;

  PayResponseModel({required this.statusCode,required this.message,required this.result});

  factory PayResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PayResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayResponseModelToJson(this);
}

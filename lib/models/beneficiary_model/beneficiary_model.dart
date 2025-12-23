import 'package:json_annotation/json_annotation.dart';

import 'beneficiary_result_model.dart';

part 'beneficiary_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BeneficiaryModel {
  final String message;
  final List<BeneficiaryResultModel>? result;
  final int statusCode;

  BeneficiaryModel({required  this.message,
     this.result,
    required this.statusCode,});

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryModelToJson(this);
}

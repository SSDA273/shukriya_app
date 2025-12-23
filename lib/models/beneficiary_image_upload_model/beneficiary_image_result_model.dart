import 'package:json_annotation/json_annotation.dart';

part 'beneficiary_image_result_model.g.dart';

@JsonSerializable()
class BeneficiaryImageResultModel {
  final String? key;

  BeneficiaryImageResultModel({this.key,});

  factory BeneficiaryImageResultModel.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryImageResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryImageResultModelToJson(this);
}

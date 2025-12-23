import 'package:json_annotation/json_annotation.dart';

import 'beneficiary_image_result_model.dart';

part 'beneficiary_image_upload_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BeneficiaryImageUploadModel {
  final String message;
  final BeneficiaryImageResultModel? result;
  final int statusCode;

  BeneficiaryImageUploadModel({required  this.message,
    this.result,
    required this.statusCode,});

  factory BeneficiaryImageUploadModel.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryImageUploadModelFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryImageUploadModelToJson(this);
}

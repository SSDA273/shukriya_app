import 'package:json_annotation/json_annotation.dart';

import 'otp_result_model.dart';

part 'otp_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OTPResponseModel {
  final String message;
  final OTPResultModel? result;
  final int statusCode;

  OTPResponseModel({required this.statusCode,required this.message,required this.result});

  factory OTPResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OTPResponseModelToJson(this);
}

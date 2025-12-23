import 'package:json_annotation/json_annotation.dart';

part 'otp_result_model.g.dart';

@JsonSerializable()
class OTPResultModel {
  @JsonKey(name: 'Reference_number') final String referenceNumber;
  @JsonKey(name: 'status_description') final String statusDescription;
  @JsonKey(name: 'updated_at') final DateTime updatedAt;

  OTPResultModel({
    required this.referenceNumber,
    required this.statusDescription,
    required this.updatedAt,
  });

  factory OTPResultModel.fromJson(Map<String, dynamic> json) =>
      _$OTPResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$OTPResultModelToJson(this);
}

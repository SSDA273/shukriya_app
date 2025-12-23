import 'package:json_annotation/json_annotation.dart';

part 'sign_up_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUpResultModel {
  final String mobileNumber;
  @JsonKey(name: 'customer_data') dynamic customData;

  SignUpResultModel({required this.mobileNumber,required this.customData});

  factory SignUpResultModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResultModelToJson(this);
}

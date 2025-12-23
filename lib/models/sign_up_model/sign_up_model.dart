import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/sign_up_model/sign_up_result_model.dart';

part 'sign_up_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUpModel {
  final String message;
  final SignUpResultModel? result;
  final int statusCode;

  SignUpModel({required this.statusCode,required this.message,required this.result});

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}

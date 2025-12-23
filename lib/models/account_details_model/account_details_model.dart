import 'package:json_annotation/json_annotation.dart';

import 'account_result_model.dart';

part 'account_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountDetailsModel {
  final String message;
  final AccountResultModel? result;
  final int statusCode;

  AccountDetailsModel({required this.statusCode,required this.message,required this.result});

  factory AccountDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailsModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'account_data_model.dart';

part 'account_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountResultModel {
  final int count;
  final AccountDataModel data;

  AccountResultModel({
    required this.count,
    required this.data,
  });

  factory AccountResultModel.fromJson(Map<String, dynamic> json) =>
      _$AccountResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResultModelToJson(this);
}

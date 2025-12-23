import 'package:json_annotation/json_annotation.dart';

import 'bill_result_model.dart';


part 'bill_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillListModel {
  final String message;
  final List<BillResultModel>? result;
  final int statusCode;

  BillListModel({required  this.message,
    this.result,
    required this.statusCode,});

  factory BillListModel.fromJson(Map<String, dynamic> json) =>
      _$BillListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillListModelToJson(this);
}

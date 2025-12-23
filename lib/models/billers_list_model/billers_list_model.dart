import 'package:json_annotation/json_annotation.dart';

import 'billers_result_model.dart';

part 'billers_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillersListModel {
  final int statusCode;
  final String message;
  List<BillersResultModel>? result;

  BillersListModel({required this.statusCode,required this.message});

  factory BillersListModel.fromJson(Map<String, dynamic> json) =>
      _$BillersListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersListModelToJson(this);
}

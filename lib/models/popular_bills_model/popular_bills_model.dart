import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/popular_bills_model/popular_result_model.dart';

part 'popular_bills_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularBillsModel {
  final String message;
  final List<PopularResultModel>? result;
  final int statusCode;

  PopularBillsModel({required this.statusCode,required this.message,required this.result});

  factory PopularBillsModel.fromJson(Map<String, dynamic> json) =>
      _$PopularBillsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularBillsModelToJson(this);
}

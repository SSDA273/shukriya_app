import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/billers_type_model/types_result_model.dart';

part 'billers_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BillersTypeModel {
  final int statusCode;
  final String message;
  List<TypeResultModel>? result;

  BillersTypeModel({required this.statusCode,required this.message});

  factory BillersTypeModel.fromJson(Map<String, dynamic> json) =>
      _$BillersTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillersTypeModelToJson(this);
}

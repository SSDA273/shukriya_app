import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/customer_model/result_model.dart';

part 'customer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerModel {
  final String message;
  final ResultModel? result;
  final int statusCode;

  CustomerModel({required this.statusCode,required this.message,required this.result});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}

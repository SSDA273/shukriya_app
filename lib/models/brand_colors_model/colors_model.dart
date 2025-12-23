import 'package:json_annotation/json_annotation.dart';
import 'colors_result_model.dart';

part 'colors_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ColorsModel {
  final String message;
  final ColorsResultModel? result;
  final int statusCode;

  ColorsModel({required this.statusCode,required this.message,required this.result});

  factory ColorsModel.fromJson(Map<String, dynamic> json) =>
      _$ColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsModelToJson(this);
}

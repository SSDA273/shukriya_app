import 'package:json_annotation/json_annotation.dart';
import 'entity_result_model.dart';

part 'entity_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EntityInfoModel {
  final String message;
  final EntityResultModel? result;
  final int statusCode;

  EntityInfoModel({required this.message, this.result,required this.statusCode});

  factory EntityInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EntityInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EntityInfoModelToJson(this);
}

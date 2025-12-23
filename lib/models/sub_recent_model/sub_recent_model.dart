import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/sub_recent_model/sub_recent_result.dart';

part 'sub_recent_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SubRecentModel {
  final String message;
  final SubRecentResult? result;
  final int statusCode;

  SubRecentModel({required this.statusCode,required this.message,required this.result});

  factory SubRecentModel.fromJson(Map<String, dynamic> json) =>
      _$SubRecentModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubRecentModelToJson(this);
}

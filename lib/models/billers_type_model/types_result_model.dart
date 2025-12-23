import 'package:json_annotation/json_annotation.dart';

part 'types_result_model.g.dart';

@JsonSerializable()
class TypeResultModel {
  @JsonKey(name: '_id') final String id;
  @JsonKey(name: 'biller_type_name')
  final String typeName;
  @JsonKey(name: 'biller_type_code')
  final String typeCode;
  final bool isActive;
  final bool isVerified;
  final bool isDeleted;

  TypeResultModel({
    required this.id,
    required this.typeName,
    required this.typeCode,
    required this.isActive,
    required this.isDeleted,
    required this.isVerified,
  });

  factory TypeResultModel.fromJson(Map<String, dynamic> json) =>
      _$TypeResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeResultModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'entity_model.g.dart';

@JsonSerializable()
class EntityModel {
  final String id;
  final String name;
  final String entityKey;

  EntityModel({required this.id,required this.name,required this.entityKey});

  factory EntityModel.fromJson(Map<String, dynamic> json) =>
      _$EntityModelFromJson(json);

  Map<String, dynamic> toJson() => _$EntityModelToJson(this);
}

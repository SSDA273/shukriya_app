import 'package:json_annotation/json_annotation.dart';
part 'entity_branding_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EntityBrandingModel {
  final String? primary;
  final String? secondary;
  final String? tertiary;
  final String? fontStyle;

  EntityBrandingModel({
    this.primary,
    this.secondary,
    this.tertiary,
    this.fontStyle,
  });

  factory EntityBrandingModel.fromJson(Map<String, dynamic> json) =>
      _$EntityBrandingModelFromJson(json);

  Map<String, dynamic> toJson() => _$EntityBrandingModelToJson(this);
}

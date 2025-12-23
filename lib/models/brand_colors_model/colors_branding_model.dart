import 'package:json_annotation/json_annotation.dart';

part 'colors_branding_model.g.dart';

@JsonSerializable()
class ColorsBrandingModel {
  final String primary;
  final String secondary;
  final String tertiary;
  final String fontStyle;

  ColorsBrandingModel({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.fontStyle,
  });

  factory ColorsBrandingModel.fromJson(Map<String, dynamic> json) =>
      _$ColorsBrandingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsBrandingModelToJson(this);
}

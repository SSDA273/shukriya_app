import 'package:json_annotation/json_annotation.dart';

import 'colors_branding_model.dart';

part 'colors_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ColorsResultModel {
  @JsonKey(name: "_id") final String id;
  final String name;
  final List<ColorsBrandingModel> branding;

  ColorsResultModel({
    required this.id,
    required this.name,
    required this.branding,
  });

  factory ColorsResultModel.fromJson(Map<String, dynamic> json) =>
      _$ColorsResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsResultModelToJson(this);
}

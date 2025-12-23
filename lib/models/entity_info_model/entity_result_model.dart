import 'package:json_annotation/json_annotation.dart';

import 'entity_branding_model.dart';
part 'entity_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EntityResultModel {
  @JsonKey(name: '_id') final String? id;
  final String? name;
  @JsonKey(name: 'legal_name') final String? legalName;
  final String? logo;
  final List<EntityBrandingModel>? branding;
  @JsonKey(name: 'home_currency') final String? homeCurrency;

  EntityResultModel({
     this.id,
     this.name,
     this.logo,
     this.legalName,
     this.branding,
     this.homeCurrency,
  });

  factory EntityResultModel.fromJson(Map<String, dynamic> json) =>
      _$EntityResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$EntityResultModelToJson(this);
}

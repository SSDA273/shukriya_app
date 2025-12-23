import 'package:json_annotation/json_annotation.dart';


part 'popular_product_model.g.dart';

@JsonSerializable()
class PopularProductModel {
  @JsonKey(name: '_id') final String? id;
  final String? name;
  final String? code;
  final String? logo;

  PopularProductModel({
    this.id,
    this.name,
    this.code,
    this.logo,
  });

  factory PopularProductModel.fromJson(Map<String, dynamic> json) =>
      _$PopularProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularProductModelToJson(this);
}


import 'package:json_annotation/json_annotation.dart';

part 'sub_product_model.g.dart';

@JsonSerializable()
class SubProductModel {
@JsonKey(name: '_id') String id;
@JsonKey(name: 'name') String productName;
@JsonKey(name: 'logo') String productLogo;

SubProductModel({
required this.id,
required this.productName,
required this.productLogo,
});

factory SubProductModel.fromJson(Map<String, dynamic> json) =>
_$SubProductModelFromJson(json);

Map<String, dynamic> toJson() => _$SubProductModelToJson(this);
}

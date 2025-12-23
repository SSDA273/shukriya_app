import 'package:json_annotation/json_annotation.dart';


part 'bill_branding_model.g.dart';

@JsonSerializable()
class BillBrandingModel {
  final String? primary;
  final String? secondary;

  BillBrandingModel({
    this.primary,
    this.secondary,
  });

  factory BillBrandingModel.fromJson(Map<String, dynamic> json) =>
      _$BillBrandingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillBrandingModelToJson(this);
}

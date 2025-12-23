import 'package:json_annotation/json_annotation.dart';


part 'bill_configuration_model.g.dart';

@JsonSerializable()
class BillConfigurationModel {
  final String? shortcode;

  BillConfigurationModel({
    this.shortcode,
  });

  factory BillConfigurationModel.fromJson(Map<String, dynamic> json) =>
      _$BillConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillConfigurationModelToJson(this);
}

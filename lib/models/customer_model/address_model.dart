import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final String addressLine;
  final String addressLine2;
  final String poBox;

  AddressModel({required this.addressLine,required this.addressLine2,required this.poBox});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

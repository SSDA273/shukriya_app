import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/customer_model/address_model.dart';
import 'package:unitey_app/models/customer_model/entity_model.dart';

part 'result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultModel {
  @JsonKey(name: '_id') final String id;
  final String firstName;
  final String lastName;
  final String middleName;
  final String username;
  final String mobileNumber;
  final AddressModel address;
  final String email;
  final String createdBy;
  final bool isActive;
  final bool isVerified;
  final bool isDeleted;
  final bool onSms;
  final bool onEmail;
  final bool onPush;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String emirate;
  final String emiratesId;
  final EntityModel entityId;
  final String updatedBy;
  final String employeeName;

  ResultModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required  this.middleName,
    required this.username,
    required this.mobileNumber,
    required this.address,
    required  this.email,
    required this.createdBy,
    required this.isActive,
    required this.isVerified,
    required this.isDeleted,
    required this.onSms,
    required this.onEmail,
    required this.onPush,
    required this.createdAt,
    required  this.updatedAt,
    required this.emirate,
    required this.emiratesId,
    required this.entityId,
    required this.updatedBy,
    required this.employeeName,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';


part 'customer_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerResultModel {
  @JsonKey(name: "_id") final String? id;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? username;
  final String? mobileNumber;
  final String? email;
  final List<dynamic>? documents;
  final String? emirate;
  final String? emiratesId;
  final String? profileImage;

  CustomerResultModel({
    this.id,
    this.firstName,
    this.profileImage,
    this.lastName,
    this.middleName,
    this.username,
    this.mobileNumber,
    this.email,
    this.documents,
    this.emirate,
    this.emiratesId,
  });

  factory CustomerResultModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResultModelToJson(this);
}

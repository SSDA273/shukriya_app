import 'package:json_annotation/json_annotation.dart';

part 'pay_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PayResultModel {
  @JsonKey(name: 'reference_number') final String referenceNumber;
  @JsonKey(name: 'payment_id') final String paymentId;
  // final String status;
  // @JsonKey(name: 'sub_status') final String subStatus;
  @JsonKey(name: 'status_description') final String statusDescription;
  @JsonKey(name: 'created_at') final DateTime createdAt;
  @JsonKey(name: 'receives_by') final DateTime? receivesAt;
  @JsonKey(name: 'updated_at') final DateTime updatedAt;

  PayResultModel({
    required this.referenceNumber,
    required this.paymentId,
     this.receivesAt,
    // required this.status,
    // required  this.subStatus,
    required this.statusDescription,
    required this.createdAt,
    required this.updatedAt,

  });

  factory PayResultModel.fromJson(Map<String, dynamic> json) =>
      _$PayResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayResultModelToJson(this);
}

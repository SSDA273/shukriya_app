import 'package:json_annotation/json_annotation.dart';

part 'res_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResResultModel {
  @JsonKey(name: 'reference_number') final String referenceNumber;
  @JsonKey(name: 'pay_bill_id') final String payBillId;
  @JsonKey(name: 'status_description') final String statusDescription;
  @JsonKey(name: 'created_at') final DateTime createdAt;
  @JsonKey(name: 'updated_at') final DateTime updatedAt;

  ResResultModel({
    required this.referenceNumber,
    required this.payBillId,
    required this.statusDescription,
    required this.createdAt,
    required this.updatedAt,

  });

  factory ResResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResResultModelToJson(this);
}

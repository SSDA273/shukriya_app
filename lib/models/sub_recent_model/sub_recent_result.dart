import 'package:json_annotation/json_annotation.dart';
import 'package:unitey_app/models/sub_recent_model/sub_recent_list.dart';

part 'sub_recent_result.g.dart';

@JsonSerializable(explicitToJson: true)
class SubRecentResult {
  @JsonKey(name: 'user_number_transaction') List<dynamic> userNumberTransaction;
  @JsonKey(name: 'recent_mobile_recharge') List<SubRecentList> recentMobileRecharge;

  SubRecentResult({required this.userNumberTransaction,required this.recentMobileRecharge});

  factory SubRecentResult.fromJson(Map<String, dynamic> json) =>
      _$SubRecentResultFromJson(json);

  Map<String, dynamic> toJson() => _$SubRecentResultToJson(this);
}

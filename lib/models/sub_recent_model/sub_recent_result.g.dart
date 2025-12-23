// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_recent_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubRecentResult _$SubRecentResultFromJson(Map<String, dynamic> json) =>
    SubRecentResult(
      userNumberTransaction: json['user_number_transaction'] as List<dynamic>,
      recentMobileRecharge: (json['recent_mobile_recharge'] as List<dynamic>)
          .map((e) => SubRecentList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubRecentResultToJson(SubRecentResult instance) =>
    <String, dynamic>{
      'user_number_transaction': instance.userNumberTransaction,
      'recent_mobile_recharge':
          instance.recentMobileRecharge.map((e) => e.toJson()).toList(),
    };

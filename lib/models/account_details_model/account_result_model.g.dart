// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResultModel _$AccountResultModelFromJson(Map<String, dynamic> json) =>
    AccountResultModel(
      count: (json['count'] as num).toInt(),
      data: AccountDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountResultModelToJson(AccountResultModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data.toJson(),
    };

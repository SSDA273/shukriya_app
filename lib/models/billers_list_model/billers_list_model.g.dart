// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billers_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillersListModel _$BillersListModelFromJson(Map<String, dynamic> json) =>
    BillersListModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
    )..result = (json['result'] as List<dynamic>?)
        ?.map((e) => BillersResultModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$BillersListModelToJson(BillersListModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'result': instance.result?.map((e) => e.toJson()).toList(),
    };

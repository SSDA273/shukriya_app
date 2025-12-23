// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillListModel _$BillListModelFromJson(Map<String, dynamic> json) =>
    BillListModel(
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => BillResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$BillListModelToJson(BillListModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'statusCode': instance.statusCode,
    };

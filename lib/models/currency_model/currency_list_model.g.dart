// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyListModel _$CurrencyListModelFromJson(Map<String, dynamic> json) =>
    CurrencyListModel(
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => CurrencyValuesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrencyListModelToJson(CurrencyListModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result?.map((e) => e.toJson()).toList(),
    };

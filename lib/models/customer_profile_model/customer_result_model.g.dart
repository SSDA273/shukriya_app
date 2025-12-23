// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResultModel _$CustomerResultModelFromJson(Map<String, dynamic> json) =>
    CustomerResultModel(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      profileImage: json['profileImage'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      username: json['username'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
      documents: json['documents'] as List<dynamic>?,
      emirate: json['emirate'] as String?,
      emiratesId: json['emiratesId'] as String?,
    );

Map<String, dynamic> _$CustomerResultModelToJson(
        CustomerResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'username': instance.username,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'documents': instance.documents,
      'emirate': instance.emirate,
      'emiratesId': instance.emiratesId,
      'profileImage': instance.profileImage,
    };

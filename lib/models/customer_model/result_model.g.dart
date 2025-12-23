// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String,
      username: json['username'] as String,
      mobileNumber: json['mobileNumber'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String,
      createdBy: json['createdBy'] as String,
      isActive: json['isActive'] as bool,
      isVerified: json['isVerified'] as bool,
      isDeleted: json['isDeleted'] as bool,
      onSms: json['onSms'] as bool,
      onEmail: json['onEmail'] as bool,
      onPush: json['onPush'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      emirate: json['emirate'] as String,
      emiratesId: json['emiratesId'] as String,
      entityId: EntityModel.fromJson(json['entityId'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] as String,
      employeeName: json['employeeName'] as String,
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'username': instance.username,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address.toJson(),
      'email': instance.email,
      'createdBy': instance.createdBy,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
      'isDeleted': instance.isDeleted,
      'onSms': instance.onSms,
      'onEmail': instance.onEmail,
      'onPush': instance.onPush,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'emirate': instance.emirate,
      'emiratesId': instance.emiratesId,
      'entityId': instance.entityId.toJson(),
      'updatedBy': instance.updatedBy,
      'employeeName': instance.employeeName,
    };

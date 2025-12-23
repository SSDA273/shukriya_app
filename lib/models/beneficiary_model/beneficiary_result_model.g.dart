// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeneficiaryResultModel _$BeneficiaryResultModelFromJson(
        Map<String, dynamic> json) =>
    BeneficiaryResultModel(
      id: json['_id'] as String,
      beneficiaryTypeId: json['beneficiary_type_id'] as String?,
      beneficiaryNickName: json['beneficiary_nick_name'] as String?,
      accountBankName: json['account_bank_name'] as String?,
      logo: json['logo'] as String?,
      accountBankCode: json['account_bank_code'] as String?,
      beneficiaryAccount: json['beneficiary_account'] as String?,
      beneficiaryCurrency: json['beneficiary_currency'] as String?,
      receiveMethod: json['receive_method'] as String?,
      beneficiaryName: json['beneficiary_name'] as String?,
      beneficiaryAddress: json['beneficiary_address'] as String?,
      beneficiaryCity: json['beneficiary_city'] as String?,
      beneficiaryCountryCode: json['beneficiary_country_code'] as String?,
      beneficiaryState: json['beneficiary_state'] as String?,
      beneficiaryPostCode: json['beneficiary_post_code'] as String?,
      beneficiaryDob: json['beneficiary_dob'] == null
          ? null
          : DateTime.parse(json['beneficiary_dob'] as String),
      beneficiaryEmail: json['beneficiary_email'] as String?,
      beneficiaryContactNumber: json['beneficiary_contact_number'] as String?,
      beneficiaryWalletId: json['beneficiary_wallet_id'] as String?,
      beneficiaryWalletType: json['beneficiary_wallet_type'] as String?,
      beneficiaryIdenIssueCtry: json['beneficiary_iden_issue_ctry'] as String?,
      beneficiaryIdenId: json['beneficiary_iden_id'] as String?,
      beneficiaryIdenData: json['beneficiary_iden_data'] as String?,
      beneficiaryIdenExp: json['beneficiary_iden_exp'] == null
          ? null
          : DateTime.parse(json['beneficiary_iden_exp'] as String),
      beneficiaryIdenIssue: json['beneficiary_iden_issue'] == null
          ? null
          : DateTime.parse(json['beneficiary_iden_issue'] as String),
      beneficiaryEncCardNum: json['beneficiary_enc_card_num'] as String?,
      beneficiaryRelationship: json['beneficiary_relationship'] as String?,
      beneficiaryNameLcl: json['beneficiary_name_lcl'] as String?,
      isDefault: json['isDefault'] as bool?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['v'] as num?)?.toInt(),
      bankAccountType: json['bank_account_type'] as String?,
    );

Map<String, dynamic> _$BeneficiaryResultModelToJson(
        BeneficiaryResultModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'beneficiary_type_id': instance.beneficiaryTypeId,
      'beneficiary_nick_name': instance.beneficiaryNickName,
      'bank_account_type': instance.bankAccountType,
      'account_bank_name': instance.accountBankName,
      'account_bank_code': instance.accountBankCode,
      'beneficiary_account': instance.beneficiaryAccount,
      'beneficiary_currency': instance.beneficiaryCurrency,
      'receive_method': instance.receiveMethod,
      'beneficiary_name': instance.beneficiaryName,
      'beneficiary_address': instance.beneficiaryAddress,
      'beneficiary_city': instance.beneficiaryCity,
      'beneficiary_country_code': instance.beneficiaryCountryCode,
      'beneficiary_state': instance.beneficiaryState,
      'beneficiary_post_code': instance.beneficiaryPostCode,
      'beneficiary_dob': instance.beneficiaryDob?.toIso8601String(),
      'beneficiary_email': instance.beneficiaryEmail,
      'beneficiary_contact_number': instance.beneficiaryContactNumber,
      'beneficiary_wallet_id': instance.beneficiaryWalletId,
      'beneficiary_wallet_type': instance.beneficiaryWalletType,
      'beneficiary_iden_issue_ctry': instance.beneficiaryIdenIssueCtry,
      'beneficiary_iden_id': instance.beneficiaryIdenId,
      'beneficiary_iden_data': instance.beneficiaryIdenData,
      'beneficiary_iden_exp': instance.beneficiaryIdenExp?.toIso8601String(),
      'beneficiary_iden_issue':
          instance.beneficiaryIdenIssue?.toIso8601String(),
      'beneficiary_enc_card_num': instance.beneficiaryEncCardNum,
      'beneficiary_relationship': instance.beneficiaryRelationship,
      'beneficiary_name_lcl': instance.beneficiaryNameLcl,
      'logo': instance.logo,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
    };

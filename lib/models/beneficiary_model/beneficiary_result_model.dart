import 'package:json_annotation/json_annotation.dart';

part 'beneficiary_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BeneficiaryResultModel {
  @JsonKey(name: '_id') final String id;
  @JsonKey(name: 'beneficiary_type_id') final String? beneficiaryTypeId;
  @JsonKey(name: 'beneficiary_nick_name') final String? beneficiaryNickName;
  @JsonKey(name: 'bank_account_type')final String? bankAccountType;
  @JsonKey(name: 'account_bank_name') final String? accountBankName;
  @JsonKey(name: 'account_bank_code') final String? accountBankCode;
  @JsonKey(name: 'beneficiary_account') final String? beneficiaryAccount;
  @JsonKey(name: 'beneficiary_currency') final String? beneficiaryCurrency;
  @JsonKey(name: 'receive_method') final String? receiveMethod;
  @JsonKey(name: 'beneficiary_name') final String? beneficiaryName;
  @JsonKey(name: 'beneficiary_address') final String? beneficiaryAddress;
  @JsonKey(name: 'beneficiary_city') final String? beneficiaryCity;
  @JsonKey(name: 'beneficiary_country_code') final String? beneficiaryCountryCode;
  @JsonKey(name: 'beneficiary_state') final String? beneficiaryState;
  @JsonKey(name: 'beneficiary_post_code') final String? beneficiaryPostCode;
  @JsonKey(name: 'beneficiary_dob') final DateTime? beneficiaryDob;
  @JsonKey(name: 'beneficiary_email') final String? beneficiaryEmail;
  @JsonKey(name: 'beneficiary_contact_number') final String? beneficiaryContactNumber;
  @JsonKey(name: 'beneficiary_wallet_id') final String? beneficiaryWalletId;
  @JsonKey(name: 'beneficiary_wallet_type') final String? beneficiaryWalletType;
  @JsonKey(name: 'beneficiary_iden_issue_ctry') final String? beneficiaryIdenIssueCtry;
  @JsonKey(name: 'beneficiary_iden_id') final String? beneficiaryIdenId;
  @JsonKey(name: 'beneficiary_iden_data') final String? beneficiaryIdenData;
  @JsonKey(name: 'beneficiary_iden_exp') final DateTime? beneficiaryIdenExp;
  @JsonKey(name: 'beneficiary_iden_issue') final DateTime? beneficiaryIdenIssue;
  @JsonKey(name: 'beneficiary_enc_card_num') final String? beneficiaryEncCardNum;
  @JsonKey(name: 'beneficiary_relationship') final String? beneficiaryRelationship;
  @JsonKey(name: 'beneficiary_name_lcl') final String? beneficiaryNameLcl;
 final String? logo;
  final bool? isDefault;
  final bool? isActive;
  final bool? isDeleted;
  final String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  final int? v;

  BeneficiaryResultModel(
      {required  this.id,
        this.beneficiaryTypeId,
        this.beneficiaryNickName,
        this.accountBankName,
        this.logo,
        this.accountBankCode,
        this.beneficiaryAccount,
        this.beneficiaryCurrency,
        this.receiveMethod,
        this.beneficiaryName,
        this.beneficiaryAddress,
        this.beneficiaryCity,
        this.beneficiaryCountryCode,
        this.beneficiaryState,
        this.beneficiaryPostCode,
        this.beneficiaryDob,
        this.beneficiaryEmail,
        this.beneficiaryContactNumber,
        this.beneficiaryWalletId,
        this.beneficiaryWalletType,
        this.beneficiaryIdenIssueCtry,
        this.beneficiaryIdenId,
        this.beneficiaryIdenData,
        this.beneficiaryIdenExp,
        this.beneficiaryIdenIssue,
        this.beneficiaryEncCardNum,
        this.beneficiaryRelationship,
        this.beneficiaryNameLcl,
        this.isDefault,
        this.isActive,
        this.isDeleted,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.bankAccountType,});

  factory BeneficiaryResultModel.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryResultModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'account_data_model.g.dart';

@JsonSerializable()
class AccountDataModel {
  @JsonKey(name: 'account_id') final String accountId;
  @JsonKey(name: 'account_name') final String accountName;
  @JsonKey(name: 'account_number_last4') final String accountNumberLast4;
  @JsonKey(name: 'account_token') final String accountToken;
  @JsonKey(name: 'account_type_id') final String accountTypeId;
  @JsonKey(name: 'account_balance') final String accountBalance;
  @JsonKey(name: 'account_balance_currency') final String accountBalanceCurrency;
  @JsonKey(name: 'card_scheme') final String cardScheme;
  @JsonKey(name: 'service_provider_ID') final String serviceProviderId;
  @JsonKey(name: 'service_provider_name') final String serviceProviderName;
  @JsonKey(name: 'expiry') final String expiry;
  @JsonKey(name: 'account_status') final String accountStatus;
  @JsonKey(name: 'fullfillment_status') final String fullfillmentStatus;
  @JsonKey(name: 'linked_mobile_no') final String linkedMobileNo;

  AccountDataModel({
    required this.accountId,
    required this.accountName,
    required this.accountNumberLast4,
    required this.accountToken,
    required this.accountTypeId,
    required this.accountBalance,
    required this.accountBalanceCurrency,
    required this.cardScheme,
    required this.serviceProviderId,
    required this.serviceProviderName,
    required this.expiry,
    required this.accountStatus,
    required this.fullfillmentStatus,
    required this.linkedMobileNo,
  });
  factory AccountDataModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataModelToJson(this);
}

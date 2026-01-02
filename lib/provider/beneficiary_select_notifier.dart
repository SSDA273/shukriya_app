import 'package:flutter/cupertino.dart';
import '../models/beneficiary_model/beneficiary_result_model.dart';
import '../models/exchange_house_model/exchange_product_model.dart';
import '../models/exchange_house_model/fee_tier_model.dart';

class BeneficiarySelectNotifier extends ChangeNotifier {
  String? _accountNumber;
  String? _bankName;
  String? _name;
  String? _nickName;
  String? _id;
  String? _notes;
  String? _logo;

  String? get getBeneficiaryAccountNumber => _accountNumber;

  String? get getBeneficiaryImage => _logo;

  String? get getNotes => _notes;

  String? get getBeneficiaryBankName => _bankName;

  String? get getBeneficiaryName => _name;

  String? get getBeneficiaryNickName => _nickName;

  String? get getBeneficiaryId => _id;

  set setBeneficiaryId(String data) {
    _id = data;
    notifyListeners();
  }


  void addNotes(String notes) {
    _notes = notes;
    notifyListeners();
  }

  void selectedBeneficiary(BeneficiaryResultModel beneficiaryResultMode) {
    _accountNumber = beneficiaryResultMode.beneficiaryAccount;
    _bankName = beneficiaryResultMode.accountBankName;
    _name = beneficiaryResultMode.beneficiaryName;
    _nickName = beneficiaryResultMode.beneficiaryNickName;
    _id = beneficiaryResultMode.id;
    _logo = beneficiaryResultMode.logo;
    notifyListeners();
  }

  String? _toCountryCode;
  String? _fromCountryCode;
  String? _exchangeHouseLogo;
  double _transferFee = 0;
  num _exchangeRate = 0;
  double _sendAmount = 0;
  double _receiveAmount = 0;
  String? _exchangeHouseName;
  String? _serviceId;
  String? _feeFXId;
  num? _flatFee;
  num? _minFee;
  num? _maxFee;
  num? _percentage;
  List<FeeTierModel>? _feeTier;

  String? get getExchangeHouseName => _exchangeHouseName;
  String? get getExchangeHouseLogo => _exchangeHouseLogo;

  String? get getToCountry => _toCountryCode;

  String? get getFromCountry => _fromCountryCode;

  String? get getServiceID => _serviceId;

  List<FeeTierModel>? get getFeeTierList => _feeTier;

  num? get getFlatFee => _flatFee;

  String? get getFeeFxID => _feeFXId;

  num get getTransferFee => _transferFee;

  num? get getMinFee => _minFee;

  num? get getMaxFee => _maxFee;

  num? get getPercentage => _percentage;

  num get getExchangeRate => _exchangeRate;

  num get getSendAmount => _sendAmount;

  num get getReceiveAmount => _receiveAmount;

  set setReceiveAmount (receivedAmount){
    _receiveAmount = receivedAmount;
    notifyListeners();
  }

  set setTransferFee (fee){
    _transferFee =fee;
    notifyListeners();
  }
  void selectCountry(String toCountryCode, String fromCountryCode) {
    _toCountryCode = toCountryCode;
    _fromCountryCode = fromCountryCode;
  }

  void beneficiaryAmountCalculation(
      double amount, ExchangeProductModel exchangeProductModel) {
    _sendAmount = amount;
    _exchangeHouseName = exchangeProductModel.name;
    _exchangeHouseLogo = exchangeProductModel.logo;
    _serviceId = exchangeProductModel.serviceId;
    _exchangeRate = exchangeProductModel.fee?.fxRate ?? 0.0;
    _feeFXId = exchangeProductModel.fee?.id;
    notifyListeners();
  }



  // Frontend calculation

  // void beneficiaryAmountCalculation(
  //     double amount, ExchangeProductModel exchangeProductModel) {
  //   _sendAmount = amount;
  //   _exchangeHouseName = exchangeProductModel.name;
  //   _exchangeHouseLogo = exchangeProductModel.logo;
  //   _serviceId = exchangeProductModel.serviceId;
  //   _exchangeRate = exchangeProductModel.fee!.fxRate!;
  //   //Todo : ask to falil
  //   _feeFXId = exchangeProductModel.fee!.id;
  //   _flatFee = exchangeProductModel.fee!.feeFlat ?? 0;
  //   _minFee = exchangeProductModel.fee?.feeMin;
  //   _maxFee = exchangeProductModel.fee?.feeMax;
  //   _percentage = exchangeProductModel.fee?.feePercentage;
  //   _feeTier = exchangeProductModel.fee!.feeTier;
  //
  //   if (_minFee != null &&
  //       _maxFee != null &&
  //       _percentage != null &&
  //       exchangeProductModel.fee!.feeTier!.isEmpty) {
  //     print("Step 2 Calculation");
  //     print("flat fee $_flatFee");
  //     print("Percentage fee $_percentage");
  //     print("Tier fee $_feeTier");
  //     double percentageAmount =
  //         double.parse(((_percentage! / 100) * amount).toStringAsFixed(2));
  //     print("percentage amount $percentageAmount");
  //     num? minMaxPercentFee = percentageAmount < _minFee!
  //         ? _minFee!
  //         : percentageAmount > _maxFee!
  //             ? _maxFee
  //             : percentageAmount;
  //
  //     print("calculated amount $minMaxPercentFee ");
  //     // num minMaxPercentFee = _minFee! >= percentageAmount ? _maxFee!
  //     //     : _minFee! <= percentageAmount
  //     //     ? _maxFee!
  //     //     : percentageAmount;
  //     double totalFee =
  //         double.parse((_flatFee! + minMaxPercentFee!).toStringAsFixed(2));
  //     print("total fee $totalFee");
  //     double step1 = amount - totalFee;
  //     double step2 = step1 * _exchangeRate;
  //     _receiveAmount = step2;
  //     _receiveAmount < 0 ? _transferFee = 0 : _transferFee = totalFee;
  //     print("//////////////////////////////");
  //   } else if (exchangeProductModel.fee!.feeTier!.isNotEmpty) {
  //     print("Step 3 Calculation");
  //     num? data = 0;
  //     num min = _minFee ?? 0;
  //     num max = _maxFee ?? 0;
  //     num flatFee = _flatFee ?? 0;
  //     double percentageAmount =
  //         double.parse(((_percentage ?? 0 / 100) * amount).toStringAsFixed(2));
  //     print("percentage amount $percentageAmount");
  //     num minMaxPercentFee = min >= percentageAmount
  //         ? max
  //         : min <= percentageAmount
  //             ? max
  //             : percentageAmount;
  //     for (var e in _feeTier!) {
  //       if (e.from! <= amount && amount <= e.to!) {
  //         data = e.fee;
  //       }
  //     }
  //     print("feeTier is $data");
  //     double totalFee = double.parse(
  //         (flatFee + minMaxPercentFee + data!.toInt()).toStringAsFixed(2));
  //
  //     print("total fee $totalFee");
  //     double sendAmount = double.parse(
  //         ((amount - totalFee) * exchangeProductModel.fee!.fxRate!)
  //             .toStringAsFixed(2));
  //     print("Send Amount $sendAmount");
  //     print("//////////////////////////////");
  //
  //     _receiveAmount = sendAmount;
  //     _receiveAmount < 0 ? _transferFee = 0 : _transferFee = totalFee;
  //     notifyListeners();
  //   } else {
  //     print("Step 1 Calculation");
  //
  //     // double totalFee = double.parse((_flatFee! + minMaxPercentFee).toStringAsFixed(2));
  //     // print("total fee $totalFee");
  //     double step1 = amount - _flatFee!;
  //     double step2 = step1 * _exchangeRate;
  //     _receiveAmount = step2;
  //
  //     print("Flat fee $_flatFee");
  //     print("AED amount $step1");
  //
  //     _receiveAmount < 0 ? _transferFee = 0 : _transferFee = _flatFee!;
  //     print("//////////////////////////////");
  //   }
  //   notifyListeners();
  // }

  void beneficiaryReverseCalculation(
      double amount, ExchangeProductModel exchangeProductModel) {
    final amountAED = amount / 20.45;
    print("AED Amount $amountAED");
    double totalFee =
    double.parse((exchangeProductModel.fee?.feeFlat ?? 0.0).toStringAsFixed(2));
    print("Flat fee $totalFee");

    double sendAmount = amountAED + totalFee;
    print("Send Amount$sendAmount");
    _sendAmount = sendAmount;

    //   print("Send Amount $send_amount");
    _exchangeRate = exchangeProductModel.fee?.fxRate ?? 0.0;

    _sendAmount < 0 ? _transferFee = 0 : _transferFee = totalFee;
    print(_transferFee);
    notifyListeners();
    // }
  }
}

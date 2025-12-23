import 'package:flutter/material.dart';
import 'package:unitey_app/models/bill_list_model/bill_product_model.dart';
import 'package:unitey_app/models/bill_list_model/bill_result_model.dart';
import 'package:unitey_app/models/billers_list_model/billers_result_model.dart';
import 'package:unitey_app/models/sub_recent_model/sub_recent_list.dart';

class BillsSelectionNotifier extends ChangeNotifier {

  //Already saved billers details Providers
  String? _billerId,
      _billerServiceId,
      _billerName,
      _billerLogo,
      _billerProviderName,
      _billerNumber;
   int _amount =0;

  set selectAmount(int amount){
    _amount=amount;
    notifyListeners();
  }
  set setMobileNumber(String number){
    _billerNumber=number;
    notifyListeners();
  }
  set setBillerName(String name){
    _billerName=name;
    notifyListeners();
  }

  String? get getBillerId => _billerId;

  int get getBillAmount => _amount;

  String? get getBillerServiceId => _billerServiceId;

  String? get getBillerName => _billerName;

  String? get getBillerLogo => _billerLogo;

  String? get getBillerProviderName => _billerProviderName;

  String? get getBillerNumber => _billerNumber;

  void selectedBiller(BillersResultModel billers) {
    _billerId = billers.id;
    _billerNumber = billers.billerAccountNumber;
    _billerLogo = billers.productId?.logo ?? "";
    _billerName = billers.billerNickName;
    _billerProviderName = billers.productId?.name ?? "";
    _billerServiceId = billers.serviceID ?? "";
    notifyListeners();
  }
  //Recent Billers
  void selectedFromRecentBiller(SubRecentList billers) {
    _billerId = billers.billers.id;
    _billerNumber = billers.billers.billerAccountNumber;
    _billerLogo = billers.products.productLogo;
    _billerName = billers.billers.billerNickName;
    _billerProviderName = billers.products.productName;
    _billerServiceId = billers.serviceId;
    notifyListeners();
  }



  //New Bill details providers

  String? _billId, _billServiceId, _billName, _billLogo, _billNumber, _subBillId, _subBillName, _subBillLogo;

  String? get getSubBillId => _subBillId;

  String? get getSubBillName => _subBillName;

  String? get getSubBillLogo => _subBillLogo;

  String? get getBillId => _billId;
   set setBillId(String data){
     _billId =data;
     notifyListeners();
   }

  String? get getBillServiceId => _billServiceId;

  String? get getBillName => _billName;

  String? get getBillLogo => _billLogo;

  String? get getBillNumber => _billNumber;

  //New creating bill screen
  void selectedBill(BillResultModel bill) {
    _subBillId = bill.id;
    _subBillLogo = bill.logo ?? "";
    _subBillName = bill.name;
    print("Sub Bill Id $_subBillId");
    notifyListeners();
  }

  void selectedBillProduct(BillProductModel billProduct) {
    _billId = billProduct.id;
    _billName = billProduct.name;
    _billLogo = billProduct.logo;
    _billServiceId = billProduct.serviceId;
    print("Service Id $_billServiceId");
    notifyListeners();
  }

}

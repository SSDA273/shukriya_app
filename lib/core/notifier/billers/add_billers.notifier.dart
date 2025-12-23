import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/api/billers/add_biller_api.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/provider/biller_select_notifier.dart';
import 'package:unitey_app/widgets/error_alert.dart';

class AddBillersNotifier extends ChangeNotifier {
  final AddBillerAPI _addBillerAPI = AddBillerAPI();
  final CacheService _cacheService = CacheService();
  bool isLoading = false;

  Future<String?> addBillers({
    required BuildContext context,
    required String serviceId,
    required String billerTypeId,
    required String billerCurrency,
    required String billerName,
    required String billerNickName,
    required String billerCity,
    required String billerCountryCode,
    required String billerAccountName,
    required String billerAccountNumber,
    String? billerDOB,
    String? billerState,
    String? billerPostCode,
    required String productId,
  }) async {
    final billerIdUpdate = Provider.of<BillsSelectionNotifier>(context,listen: false);
    try {
      print("biller id is $billerTypeId");
      final customerId = await _cacheService.readCache(key: "customerId");
      final data = await _addBillerAPI.addBiller(
        serviceId: serviceId,
        productsId: productId,
        customerId: customerId,
        billerTypeId: billerTypeId,
        billerCurrency: billerCurrency,
        billerName: billerName,
        billerNickName: billerNickName,
        billerCity: billerCity,
        billerCountryCode: billerCountryCode,
        billerAccountName: billerAccountName,
        billerAccountNumber: billerAccountNumber,
      );
      final message = data["message"];
      final statusCode = data["statusCode"];

      if (message == "Name Already Exists") {
        return "Error";
      } else if (statusCode != 200) {
        showDialog(
            context: context,
            builder: (context) {
              return ErrorAlert(
                mainText: 'Please contact Admin', subText: message,);
            });
      } else {
        final referenceNumber = data["result"]['reference_number'];
        final billId = data["result"]['biller_id'];
        billerIdUpdate.setBillId=billId;
        return referenceNumber;
      }
    }catch(error){
      rethrow;
    }
    return null;
  }
}

//
// } on SocketException catch (e) {
// throw SocketException(e.toString());
// } on FormatException catch (_) {
// throw const FormatException("Unable to process the data");
// } catch (error) {
// // rethrow;
// ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// backgroundColor: Colors.red, content: Text("Session expired. Please close and open app again")));
// }
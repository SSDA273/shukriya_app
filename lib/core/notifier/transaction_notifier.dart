import 'package:flutter/material.dart';

class TransactionModel {
  final String title;
  final String description;
  final String amount;
  final String status;
  final String date;
  final String? referenceNumber;

  TransactionModel({
    required this.title,
    required this.description,
    required this.amount,
    required this.status,
    required this.date,
    this.referenceNumber,
  });
}

class TransactionNotifier extends ChangeNotifier {
  final List<TransactionModel> _transactions = [
    TransactionModel(
      title: "Send to in",
      description: "From: WPS Card",
      amount: "155.0 AED",
      status: "Success",
      date: "2026-02-18",
      referenceNumber: "TXN8273645019",
    ),
    TransactionModel(
      title: "Send to Nihad",
      description: "From: WPS Card",
      amount: "10,000.00 AED",
      status: "Success",
      date: "12-01-2021",
      referenceNumber: "TXN7728394012",
    ),
    TransactionModel(
      title: "Du Recharge",
      description: "From: WPS Card",
      amount: "20.00 AED",
      status: "Success",
      date: "03-01-2021",
      referenceNumber: "TXN1209348576",
    ),
    TransactionModel(
      title: "Du Recharge",
      description: "From: WPS Card",
      amount: "399.00 AED",
      status: "Success",
      date: "01-01-2021",
      referenceNumber: "TXN5564738291",
    ),
    TransactionModel(
      title: "Etisalat Recharge",
      description: "From: WPS Card",
      amount: "199.00 AED",
      status: "Success",
      date: "01-01-2021",
      referenceNumber: "TXN9901827364",
    ),
    TransactionModel(
      title: "Send to John",
      description: "From: WPS Card",
      amount: "20,000.00 AED",
      status: "Success",
      date: "31-10-2020",
      referenceNumber: "TXN2233445566",
    ),
  ];

  List<TransactionModel> get transactions => _transactions;

  void addTransaction(TransactionModel transaction) {
    _transactions.insert(0, transaction);
    notifyListeners();
  }
}

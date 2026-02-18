import 'package:flutter/material.dart';
import 'package:unitey_app/constant/constants.dart';

import 'package:provider/provider.dart';
import '../../../../../core/notifier/transaction_notifier.dart';
import '../../../../../constant/color_manger.dart';
import '../../../../../constant/font_manager.dart';

class RecentTransactionScreen extends StatelessWidget {
  const RecentTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Recent Transactions",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: FontSize.s17,color: Colors.black),
          )),
      body: SafeArea(
        child: Consumer<TransactionNotifier>(
          builder: (context, notifier, child) {
            return ListView.builder(
              itemCount: notifier.transactions.length,
              itemBuilder: (context, index) {
                final tx = notifier.transactions[index];
                return MailCard(
                  title: tx.title,
                  description: tx.date,
                  time: tx.amount,
                  status: tx.status,
                  cardDescription: tx.description,
                  referenceNumber: tx.referenceNumber,
                );
              },
            );
          },
        ),
      ),
    );
  }
}


class MailCard extends StatelessWidget {
  const MailCard({
    Key? key,
    required String time,
    required String title,
    required String description,
    required String status,
    required String cardDescription,
    String? referenceNumber,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _description = description,
        _status = status,
        _cardDescription = cardDescription,
        _referenceNumber = referenceNumber,
        _color = color,
        super(key: key);

  final String _time;
  final String _title;
  final String _description;
  final String _status;
  final String _cardDescription;
  final String? _referenceNumber;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: Border(
          bottom: BorderSide(
            color: ColorManager.primary,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Text(
                  _cardDescription,
                  style: TextStyle(color: Colors.black38, fontSize: 13),
                ),
                if (_referenceNumber != null)
                  Text(
                    _referenceNumber!,
                    style: TextStyle(color: ColorManager.primary, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                SizedBox(height: 5),
                Text(
                  _description,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _time,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              kSizedBox5,
              Text(
                _status,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: _status.toLowerCase() == "success" ? Colors.green : Colors.red,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

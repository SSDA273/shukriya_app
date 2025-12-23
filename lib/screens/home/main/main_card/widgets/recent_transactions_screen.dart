import 'package:flutter/material.dart';
import 'package:unitey_app/constant/constants.dart';

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
        child: Column(
          children: const [
            MailCard(
              title: "Send to Nihad",
              description:
              "12-01-2021",
              time: "10,000.00 AED",
            ),
            MailCard(
              title: "Du Recharge",
              description:
              "03-01-2021",
              time: "20.00 AED",
            ),
            MailCard(
              title: "Du Recharge",
              description:
              "01-01-2021",
              time: "399.00 AED",
            ),
            MailCard(
              title: "Etisalat Recharge",
              description:
              "01-01-2021",
              time: "199.00 AED",
            ),
            MailCard(
              title: "Send to John",
              description:
              "31-10-2020",
              time: "20,000.00 AED",
            ),
          ],
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
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _description = description,
        _color = color,
        super(key: key);

  final String _time;
  final String _title;
  final String _description;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: Border(
          bottom: BorderSide(
            color:  ColorManager.primary,
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
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                  ),
                ),
                Text("From: WPS Card",
                  style: TextStyle(
                    color: Colors.black38,
                      fontSize: 13
                  ),),
                SizedBox(height: 5),
                Text(_description,
                  style: TextStyle(
                      fontSize: 13
                  ),),
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
                  fontSize: 20,
                ),
              ),
              kSizedBox5,
              Text(
                "Success",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                ),
              ),
              // Image.asset(Helper.getAssetName("star.png", "virtual"))
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/style_manager.dart';

class PushNotificationCustomWidget extends StatelessWidget {
  final VoidCallback onReplay;
  final String title;
  final String body;
  final Widget leading;

  const PushNotificationCustomWidget(
      {Key? key,
      required this.onReplay,
      required this.title,
      required this.body,
      required this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.secondary,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SafeArea(
        child: ListTile(

          leading: SizedBox.fromSize(
              size: const Size(40, 40),
              child: ClipOval(
                child: leading,
              )),
          title: Text(title),
          subtitle: Text(
            body,
            style: getRegularStyle(color: ColorManager.black),
          ),
          // trailing: IconButton(
          //     icon: Icon(Icons.reply),
          //     onPressed: () {
          //       ///TODO i'm not sure it should be use this widget' BuildContext to create a Dialog
          //       ///maybe i will give the answer in the future
          //       if (onReplay != null) onReplay();
          //     }),
        ),
      ),
    );
  }
}

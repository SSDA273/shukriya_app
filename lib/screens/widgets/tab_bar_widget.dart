import 'package:flutter/material.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unitey_app/constant/style_manager.dart';

import '../../generated/l10n.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    required this.index,
    required this.onChangedTab,
    Key? key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTabItem(
            index: 0,
            text:S.of(context).home,
            icon:ImageAssets.filledBottomHome,
            unSelectedIcon:ImageAssets.bottomHome,
          ),
          buildTabItem(
            index: 1,
            text: S.of(context).receiveMoney,
            icon:ImageAssets.filledBottomReceive,
            unSelectedIcon:ImageAssets.bottomReceive,
          ),
          buildTabItem(
            index: 2,
            text: S.of(context).sendMoney,
            icon:ImageAssets.filledBottomSend,
              unSelectedIcon:ImageAssets.bottomSend,
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required String text,
    required String icon,
    required String unSelectedIcon,
  }) {
    final isSelected = index == widget.index;

    return GestureDetector(
      onTap: () => widget.onChangedTab(index),
      child: SizedBox(
        height: 76,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected?icon:unSelectedIcon,
              height: 32,
              width:  32,
            ),
            Text(text,
            textAlign: TextAlign.center,
            style: getRegularStyle(
                color: isSelected?ColorManager.primary:ColorManager.grey2))
          ],
        ),
      ),
    );
  }
}
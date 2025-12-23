import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String text;
  final String value;
  final List<PopupMenuEntry> list;
  final Function(dynamic)? onSelect;

  const CustomDropDown({Key? key, required this.text, required this.list,required this.onSelect,required this.value, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(value,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize:  16),
          overflow: TextOverflow.ellipsis,),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Transform.scale(
              scale: 0.5,
              child: PopupMenuButton(
                child: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 30,
                    color: Colors.green,
                  ),
                // offset: Offset(-70, 5),
                onSelected: onSelect,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                itemBuilder: (BuildContext context) {
                  return list;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}


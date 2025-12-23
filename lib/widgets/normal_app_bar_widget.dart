import 'package:flutter/material.dart';


class NormalAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const NormalAppBarWidget({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(title,
        style: Theme.of(context).textTheme.subtitle1,),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.adaptive.arrow_back,
          color: Colors.black,),
        onPressed: ()=>Navigator.pop(context),
      ),
      titleSpacing: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}

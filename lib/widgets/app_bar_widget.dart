import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isShowBack;
  final List<Widget>? actions;
  final Widget? title;
  final bool centerTitle;

  const AppBarWidget({
    this.title,
    this.actions,
    this.isShowBack = false,
    this.centerTitle = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title,
      centerTitle: centerTitle,
      leading: isShowBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                // size: 30,
              ),
              color: Colors.black,
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

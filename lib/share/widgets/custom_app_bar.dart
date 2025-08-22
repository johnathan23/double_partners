import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Color? bgColor;

  const CustomAppBar({super.key, this.title, this.actions, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? '', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
      actions: actions,
      centerTitle: false,
      backgroundColor: bgColor,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

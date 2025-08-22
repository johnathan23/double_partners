import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomListTitle({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      contentPadding: kPaddingAll(kNone),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

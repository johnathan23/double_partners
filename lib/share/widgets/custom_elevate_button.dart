import 'package:flutter/material.dart';

class CustomElevateButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color backgroundColor;
  const CustomElevateButton({super.key, required this.onPressed, required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor)),
      child: Text(title),
    );
  }
}

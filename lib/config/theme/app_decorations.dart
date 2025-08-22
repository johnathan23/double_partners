import 'dart:ui';

import 'package:double_partners/config/theme/app_colors.dart';
import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static InputBorder _inputBorder({required Color color}) =>
      OutlineInputBorder(borderSide: BorderSide(color: color), borderRadius: BorderRadius.circular(kSize5));

  static InputDecoration inputDecoration({
    required BuildContext context,
    required String? hint,
    required String? label,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
  }) => InputDecoration(
    label: label != null ? Text(label) : null,
    alignLabelWithHint: true,
    hintText: hint,
    labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: kGrey),
    hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: kGrey),
    border: InputBorder.none,
    filled: true,
    contentPadding: contentPadding,
    fillColor: kWhite,
    enabledBorder: _inputBorder(color: kGrey),
    focusedErrorBorder: _inputBorder(color: kRed),
    focusedBorder: _inputBorder(color: kBlue02),
    errorBorder: _inputBorder(color: kRed),
    suffixIcon: suffixIcon,
    errorMaxLines: 2,
  );
}

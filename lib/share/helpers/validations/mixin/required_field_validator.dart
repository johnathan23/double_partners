import 'package:double_partners/l10n/app_localizations.dart' show AppLocalizations;
import 'package:double_partners/share/helpers/validations/contract/validator.dart';
import 'package:flutter/material.dart';

mixin RequiredFieldValidator on Validator {
  String? validateRequiredField({required BuildContext context, required String? value}) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).requiredField;
    }
    return null;
  }
}

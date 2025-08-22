import 'package:double_partners/l10n/app_localizations.dart';
import 'package:double_partners/share/helpers/validations/mixin/required_field_validator.dart';
import 'package:flutter/material.dart';
import 'contract/validator.dart';

class Validations {
  static String? requiredField({required BuildContext context, required String? value}) {
    return _RequiredFieldValidator().validate(context: context, value: value);
  }

  static String? phone({required BuildContext context, required String? value}) {
    return _PhoneValidation().validate(context: context, value: value);
  }

  static String? postalCode({required BuildContext context, required String? value}) {
    return _PostalCodeValidation().validate(context: context, value: value);
  }
}

class _RequiredFieldValidator extends Validator with RequiredFieldValidator {
  @override
  String? validate({required BuildContext context, required String? value}) {
    String? msg = validateRequiredField(context: context, value: value);
    if (msg != null) {
      return msg;
    }
    return null;
  }
}

class _PostalCodeValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required BuildContext context, required String? value}) {
    final RegExp postalCodeRegExp = RegExp(r'^\d{6}$');

    String? msg = validateRequiredField(context: context, value: value);
    if (msg != null) {
      return msg;
    }

    if (!postalCodeRegExp.hasMatch(value!)) {
      return AppLocalizations.of(context).invalidPostalCode;
    }

    return null;
  }
}

class _PhoneValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required BuildContext context, required String? value}) {
    final RegExp phoneRegExp = RegExp(r'^[0-9]{10}$');

    String? msg = validateRequiredField(context: context, value: value);
    if (msg != null) {
      return msg;
    }

    if (!phoneRegExp.hasMatch(value!)) {
      return AppLocalizations.of(context).invalidPhoneNumber;
    }

    return null;
  }
}

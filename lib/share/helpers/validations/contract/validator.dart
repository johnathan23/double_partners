import 'package:flutter/material.dart';

abstract class Validator {
  String? validate({required BuildContext context, required String? value});
}

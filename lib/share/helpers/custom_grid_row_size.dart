import 'package:flutter/material.dart';

class CustomGridRowSize {
  static int byDefault(BuildContext context) {
    switch (MediaQuery.of(context).size.width) {
      case >= 360 && <= 540:
        return 1;
      case >= 768 && <= 1023:
        return 2;
      case >= 1024:
        return 3;
      default:
        return 1;
    }
  }
}

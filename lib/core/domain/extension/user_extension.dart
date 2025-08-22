import 'package:double_partners/core/domain/models/user_model.dart';

extension UserExtension on UserModel {
  String get fullName {
    return '$names $surnames';
  }
}

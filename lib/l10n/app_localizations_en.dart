// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get users => 'Users';

  @override
  String get favorites => 'Favorites';

  @override
  String get userCreation => 'User Creation';

  @override
  String get userDetails => 'User Details';

  @override
  String get userEdit => 'User Edit';

  @override
  String get userList => 'User List';

  @override
  String get requiredField => 'This field is required.';

  @override
  String get invalidPhoneNumber => 'Invalid phone number format.';

  @override
  String get invalidPostalCode => 'Invalid postal code format.';

  @override
  String get names => 'Names';

  @override
  String get surnames => 'Surnames';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get address => 'Address';

  @override
  String get addAddress => 'Add Address';

  @override
  String get newAddress => 'New Address';

  @override
  String get editAddress => 'Edit Address';

  @override
  String get city => 'City';

  @override
  String get stateProvince => 'State/Province';

  @override
  String get postalCode => 'Postal Code';

  @override
  String get country => 'Country';

  @override
  String get searchUser => 'Search User';

  @override
  String get userNotFound => 'User not found.';

  @override
  String get userCreatedSuccessfully => 'User created successfully.';

  @override
  String get userUpdatedSuccessfully => 'User updated successfully.';

  @override
  String get userDeletedSuccessfully => 'User deleted successfully.';

  @override
  String deleteUserConfirmation(String value) {
    return 'Are you sure you want to delete $value?';
  }

  @override
  String get addressCreatedSuccessfully => 'Address created successfully.';

  @override
  String get addressUpdatedSuccessfully => 'Address updated successfully.';

  @override
  String get addressDeletedSuccessfully => 'Address deleted successfully.';

  @override
  String get personalInfo => 'Personal Info';

  @override
  String get createUser => 'Create User';

  @override
  String get emptyUserList => 'No users available. Please add a new user.';

  @override
  String get addresses => 'Addresses';
}

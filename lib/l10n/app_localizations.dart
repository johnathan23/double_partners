import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// Label for the users section in the application.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// Label for the favorites section in the application.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Title for the user creation page.
  ///
  /// In en, this message translates to:
  /// **'User Creation'**
  String get userCreation;

  /// Title for the user details page.
  ///
  /// In en, this message translates to:
  /// **'User Details'**
  String get userDetails;

  /// Title for the user edit page.
  ///
  /// In en, this message translates to:
  /// **'User Edit'**
  String get userEdit;

  /// Title for the user list page.
  ///
  /// In en, this message translates to:
  /// **'User List'**
  String get userList;

  /// Message displayed when a required field is left empty.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get requiredField;

  /// Message displayed when the phone number format is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format.'**
  String get invalidPhoneNumber;

  /// Message displayed when the postal code format is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid postal code format.'**
  String get invalidPostalCode;

  /// No description provided for @names.
  ///
  /// In en, this message translates to:
  /// **'Names'**
  String get names;

  /// No description provided for @surnames.
  ///
  /// In en, this message translates to:
  /// **'Surnames'**
  String get surnames;

  /// Label for the date of birth field in user forms.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// Label for the phone number field in user forms.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Label for the address field in user forms.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Button text to add a new address in user forms.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addAddress;

  /// Title for the new address form.
  ///
  /// In en, this message translates to:
  /// **'New Address'**
  String get newAddress;

  /// Title for the edit address form.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// Label for the city field in user forms.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Label for the state or province field in user forms.
  ///
  /// In en, this message translates to:
  /// **'State/Province'**
  String get stateProvince;

  /// Label for the postal code field in user forms.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postalCode;

  /// Label for the country field in user forms.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// Placeholder text for the user search input.
  ///
  /// In en, this message translates to:
  /// **'Search User'**
  String get searchUser;

  /// Message displayed when a user search does not return any results.
  ///
  /// In en, this message translates to:
  /// **'User not found.'**
  String get userNotFound;

  /// Message displayed when a user is created successfully.
  ///
  /// In en, this message translates to:
  /// **'User created successfully.'**
  String get userCreatedSuccessfully;

  /// Message displayed when a user is updated successfully.
  ///
  /// In en, this message translates to:
  /// **'User updated successfully.'**
  String get userUpdatedSuccessfully;

  /// Message displayed when a user is deleted successfully.
  ///
  /// In en, this message translates to:
  /// **'User deleted successfully.'**
  String get userDeletedSuccessfully;

  /// Confirmation message shown before deleting a user.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {value}?'**
  String deleteUserConfirmation(String value);

  /// Message displayed when an address is created successfully.
  ///
  /// In en, this message translates to:
  /// **'Address created successfully.'**
  String get addressCreatedSuccessfully;

  /// Message displayed when an address is updated successfully.
  ///
  /// In en, this message translates to:
  /// **'Address updated successfully.'**
  String get addressUpdatedSuccessfully;

  /// Message displayed when an address is deleted successfully.
  ///
  /// In en, this message translates to:
  /// **'Address deleted successfully.'**
  String get addressDeletedSuccessfully;

  /// Section title for personal information in user details.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// Button text to create a new user.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get createUser;

  /// Message displayed when there are no users in the list.
  ///
  /// In en, this message translates to:
  /// **'No users available. Please add a new user.'**
  String get emptyUserList;

  /// Label for the addresses section in user details.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get addresses;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

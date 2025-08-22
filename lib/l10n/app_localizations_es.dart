// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get users => 'Usuarios';

  @override
  String get favorites => 'Favoritos';

  @override
  String get userCreation => 'Creación de Usuario';

  @override
  String get userDetails => 'Detalles del Usuario';

  @override
  String get userEdit => 'Editar Usuario';

  @override
  String get userList => 'Lista de Usuarios';

  @override
  String get requiredField => 'Este campo es obligatorio.';

  @override
  String get invalidPhoneNumber => 'Formato de número de teléfono inválido.';

  @override
  String get invalidPostalCode => 'Formato de código postal inválido.';

  @override
  String get names => 'Nombres';

  @override
  String get surnames => 'Apellidos';

  @override
  String get dateOfBirth => 'Fecha de Nacimiento';

  @override
  String get phoneNumber => 'Número de Teléfono';

  @override
  String get address => 'Dirección';

  @override
  String get addAddress => 'Añadir Dirección';

  @override
  String get newAddress => 'Nueva Dirección';

  @override
  String get editAddress => 'Editar Dirección';

  @override
  String get city => 'Ciudad';

  @override
  String get stateProvince => 'Estado/Provincia';

  @override
  String get postalCode => 'Código Postal';

  @override
  String get country => 'País';

  @override
  String get searchUser => 'Buscar Usuario';

  @override
  String get userNotFound => 'Usuario no encontrado.';

  @override
  String get userCreatedSuccessfully => 'Usuario creado exitosamente.';

  @override
  String get userUpdatedSuccessfully => 'Usuario actualizado exitosamente.';

  @override
  String get userDeletedSuccessfully => 'Usuario eliminado exitosamente.';

  @override
  String deleteUserConfirmation(String value) {
    return '¿Estás seguro de que deseas eliminar al usuario $value ?';
  }

  @override
  String get addressCreatedSuccessfully => 'Dirección creada exitosamente.';

  @override
  String get addressUpdatedSuccessfully => 'Dirección actualizada exitosamente.';

  @override
  String get addressDeletedSuccessfully => 'Dirección eliminada exitosamente.';

  @override
  String get personalInfo => 'Información Personal';

  @override
  String get createUser => 'Crear Usuario';

  @override
  String get emptyUserList => 'No hay usuarios disponibles.';

  @override
  String get addresses => 'Direcciones';
}

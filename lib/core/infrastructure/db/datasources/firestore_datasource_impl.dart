import 'package:double_partners/core/domain/datasources/firestore_datasource.dart';
import 'package:double_partners/core/domain/enum/log_level_enum.dart';
import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/core/infrastructure/db/firestore_db.dart';

import '../../../../share/helpers/custom_console.dart';

class FirestoreDatasourceImpl implements FirestoreDatasource {
  late FirestoreDb _db;

  FirestoreDatasourceImpl() {
    _db = FirestoreDb();
  }

  @override
  Future<String> addAddress(AddressModel address) {
    try {
      final result = _db.addAddress(address);
      return result;
    } catch (e) {
      CustomConsole.log(message: 'Fail to add address', error: e.toString(), level: LogLevel.warning);
      rethrow;
    }
  }

  @override
  Future<String> createUser(UserModel user) {
    try {
      final result = _db.createUser(user);
      return result;
    } catch (e) {
      CustomConsole.log(message: 'Fail to create user', error: e.toString(), level: LogLevel.warning);
      rethrow;
    }
  }

  @override
  Future<void> deleteAddress(int addressId) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final result = await _db.getUsers();
      return result;
    } catch (e) {
      CustomConsole.log(message: 'Fail to get users', error: e.toString(), level: LogLevel.warning);
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> searchUsersByName(String query) {
    // TODO: implement searchUsersByName
    throw UnimplementedError();
  }

  @override
  Future<void> updateAddress(int addressId, AddressModel address) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(int id, UserModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<String> getId(String query) async{
  try {
      final result = await _db.getUserId(query);
      return result ?? '';
    } catch (e) {
      CustomConsole.log(message: 'Fail to get user ID', error: e.toString(), level: LogLevel.warning);
      rethrow;
    }
  }

  @override
  Future<List<AddressModel>> getAddresses(String userId) async {
    try {
      final result = await _db.getAddresses(userId);
      return result;
    } catch (e) {
      CustomConsole.log(message: 'Fail to get addresses', error: e.toString(), level: LogLevel.warning);
      rethrow;
    }
  }
}

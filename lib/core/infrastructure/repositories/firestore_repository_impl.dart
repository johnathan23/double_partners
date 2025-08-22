import 'package:double_partners/core/domain/datasources/firestore_datasource.dart';
import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/core/domain/repositories/firestore_repository.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirestoreDatasource _firestoreDatasource;

  FirestoreRepositoryImpl(this._firestoreDatasource);

  @override
  Future<String> addAddress(AddressModel address) {
    return _firestoreDatasource.addAddress(address);
  }

  @override
  Future<String> createUser(UserModel user) {
    return _firestoreDatasource.createUser(user);
  }

  @override
  Future<void> deleteAddress(int addressId) {
    return _firestoreDatasource.deleteAddress(addressId);
  }

  @override
  Future<void> deleteUser(int id) {
    return _firestoreDatasource.deleteUser(id);
  }

  @override
  Future<List<UserModel>> getUsers() {
    return _firestoreDatasource.getUsers();
  }

  @override
  Future<List<UserModel>> searchUsersByName(String query) {
    return _firestoreDatasource.searchUsersByName(query);
  }

  @override
  Future<void> updateAddress(int addressId, AddressModel address) {
    return _firestoreDatasource.updateAddress(addressId, address);
  }

  @override
  Future<void> updateUser(int id, UserModel user) {
    return _firestoreDatasource.updateUser(id, user);
  }

  @override
  Future<String> getId(String query) {
    return _firestoreDatasource.getId(query);
  }

  @override
  Future<List<AddressModel>> getAddresses(String userId) {
    return _firestoreDatasource.getAddresses(userId);
  }
}

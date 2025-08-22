import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';

abstract class FirestoreDatasource {
  Future<String> createUser(UserModel user);
  Future<void> updateUser(int id, UserModel user);
  Future<void> deleteUser(int id);

  Future<List<UserModel>> getUsers();
  Future<List<UserModel>> searchUsersByName(String query);

  Future<String> getId(String query);
  Future<List<AddressModel>> getAddresses(String userId);

  Future<String> addAddress(AddressModel address);
  Future<void> updateAddress(int addressId, AddressModel address);
  Future<void> deleteAddress(int addressId);
}

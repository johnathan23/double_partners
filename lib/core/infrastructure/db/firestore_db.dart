import 'package:double_partners/core/domain/extension/user_extension.dart';
import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/core/infrastructure/services/firebase_firestore_service.dart';
import 'package:flutter/cupertino.dart';

class FirestoreDb {
  static const String _collectionNameUsers = 'users';
  static const String _collectionNameAddresses = 'addresses';

  @protected
  late FirebaseFireStoreService firestoreService;

  FirestoreDb() {
    firestoreService = FirebaseFireStoreService();
  }

  Future<String> createUser(UserModel user) async {
    final response = await firestoreService.addDocument(collectionName: _collectionNameUsers, data: user.toJson());
    return response.id;
  }

  Future<void> updateUser(String userId, UserModel user) async {
    await firestoreService.updateDocument(collectionName: _collectionNameUsers, documentId: userId, data: user.toJson());
  }

  Future<void> deleteUser(String userId) async {
    await firestoreService.deleteDocument(collectionName: _collectionNameUsers, documentId: userId);
  }

  Future<List<UserModel>> getUsers() async {
    final response = await firestoreService.getCollection(collectionName: _collectionNameUsers);
    return response.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
  }

  Future<List<UserModel>> searchUsersByName(String query) async {
    final response = await firestoreService.getCollection(collectionName: _collectionNameUsers);
    return response.docs
        .map((doc) => UserModel.fromJson(doc.data()))
        .where((user) => user.fullName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<String> addAddress(AddressModel address) async {
    final response = await firestoreService.addDocument(collectionName: _collectionNameAddresses, data: address.toJson());
    return response.id;
  }

  Future<void> updateAddress(String addressId, AddressModel address) async {
    await firestoreService.updateDocument(collectionName: _collectionNameAddresses, documentId: addressId, data: address.toJson());
  }

  Future<void> deleteAddress(String addressId) async {
    await firestoreService.deleteDocument(collectionName: _collectionNameAddresses, documentId: addressId);
  }

  Future<List<AddressModel>> getAddresses(String userId) async {
    final response = await firestoreService.getCollection(collectionName: _collectionNameAddresses);
    return response.docs.map((doc) => AddressModel.fromJson(doc.data())).where((address) => address.userId == userId).toList();
  }

  Future<String?> getUserId(String query) async {
    final res = await firestoreService.getCollection(
      collectionName: _collectionNameUsers,
    );

    final q = query;

    for (final d in res.docs) {
      final data = d.data();
      final names = (data['names'] as String? ?? '');
      final surnames = (data['surnames'] as String? ?? '');
      final full = '$names $surnames';

      if (full == q) {
        return d.id;
      }
    }
    return null;
  }
}

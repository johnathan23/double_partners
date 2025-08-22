import 'package:double_partners/core/domain/datasources/firestore_datasource.dart';
import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/core/domain/repositories/firestore_repository.dart';
import 'package:double_partners/core/infrastructure/db/datasources/firestore_datasource_impl.dart';
import 'package:double_partners/core/infrastructure/repositories/firestore_repository_impl.dart';
import 'package:double_partners/share/providers/states/firestore_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@riverpod
class Firestore extends _$Firestore {
  @override
  FirestoreState build() {
    return FirestoreState();
  }

  FirestoreRepository get _firestoreRepository {
    final FirestoreDatasource dataSource = FirestoreDatasourceImpl();
    return FirestoreRepositoryImpl(dataSource);
  }

  Future<void> createUser(UserModel user, List<AddressModel>? addresses) async {
    state = state.copyWith(isLoading: true);
    try {
      final userId = await _firestoreRepository.createUser(user);
      if (addresses == null || addresses.isEmpty) {
        state = state.copyWith(isLoading: false, isError: false, errorMessage: '');
        return;
      }
      for (AddressModel address in addresses) {
        final a = address.copyWith(userId: userId);
        await _firestoreRepository.addAddress(a);
      }
      state = state.copyWith(isLoading: false, isError: false, errorMessage: '');
    } catch (e) {
      state = state.copyWith(isError: true, errorMessage: e.toString());
      throw Exception('Error creating user: $e');
    }
  }

  Future<void> getUsers() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _firestoreRepository.getUsers();
      state = state.copyWith(users: response, isLoading: false, isError: false, errorMessage: '');
    } catch (e) {
      state = state.copyWith(isError: true, errorMessage: e.toString());
      throw Exception('Error fetching users: $e');
    }
  }

  Future<void> searchUsersByName(String query) async {
    try {} catch (e) {
      state = state.copyWith(isError: true, errorMessage: e.toString());
      throw Exception('Error searching users by name: $e');
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      final current = state.addresses ?? const <AddressModel>[];
      final updated = List<AddressModel>.from(current)..add(address);

      state = state.copyWith(
        addresses: updated,
        isError: false,
        errorMessage: '',
      );
    } catch (e) {
      state = state.copyWith(isError: true, errorMessage: e.toString());
      throw Exception('Error adding address: $e');
    }
  }

  Future<void> getAddresses(String userFullName) async {
    state = state.copyWith(isLoading: true);
    try {
      final userId = await _firestoreRepository.getId(userFullName);
      if(userId.isEmpty) {
        state = state.copyWith(isLoading: false, isError: true, errorMessage: 'User not found');
        return;
      }
      final response = await _firestoreRepository.getAddresses(userId);
      state = state.copyWith(addresses: response, isLoading: false, isError: false, errorMessage: '');
    } catch (e) {
      state = state.copyWith(isError: true, errorMessage: e.toString());
      throw Exception('Error fetching addresses: $e');
    }
  }

  Future<void> clearAddresses() async {
    state = state.copyWith(addresses: []);
  }
}

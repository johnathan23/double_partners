import 'package:double_partners/core/domain/models/address_model.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_state.freezed.dart';
part 'firestore_state.g.dart';

@freezed
abstract class FirestoreState with _$FirestoreState {
  const factory FirestoreState({
    List<UserModel>? users,
    List<AddressModel>? addresses,
    List<UserModel>? filteredUsers,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    String? errorMessage,
  }) = _FirestoreState;

  factory FirestoreState.fromJson(Map<String, dynamic> json) => _$FirestoreStateFromJson(json);
}

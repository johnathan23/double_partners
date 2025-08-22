import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  static final String localeKey = 'locale';
  static final String favoritesKey = 'favorites';
  static final String usersKey = 'users';

  SessionManager._internal();
  static final SessionManager _instance = SessionManager._internal();
  late FlutterSecureStorage _storage;

  factory SessionManager() => _instance;

  Future<void> init() async {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
      webOptions: WebOptions(),
      wOptions: WindowsOptions(),
      mOptions: MacOsOptions(useDataProtectionKeyChain: true),
      lOptions: LinuxOptions(),
    );
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  // ?  Getters and Setters for locale

  Future<String> getLocale() async {
    return await _storage.read(key: localeKey) ?? 'es';
  }

  Future<void> setLocale(String locale) async {
    await _storage.write(key: localeKey, value: locale);
  }

  Future<List<UserModel>> getUsers() async {
    final String? usersJson = await _storage.read(key: usersKey);
    if (usersJson == null) return [];
    final List<dynamic> usersList = List<dynamic>.from(usersJson.isNotEmpty ? usersJson.split(',') : []);
    return usersList.map((user) => UserModel.fromJson(user)).toList();
  }

  Future<void> setUsers(List<UserModel> users) async {
    final String usersJson = users.map((user) => user.toJson()).join(',');
    await _storage.write(key: usersKey, value: usersJson);
  }

  Future<List<UserModel>> getFavorites() async {
    final String? favoritesJson = await _storage.read(key: favoritesKey);
    if (favoritesJson == null) return [];
    final List<dynamic> favoritesList = List<dynamic>.from(favoritesJson.isNotEmpty ? favoritesJson.split(',') : []);
    return favoritesList.map((user) => UserModel.fromJson(user)).toList();
  }

  Future<void> setFavorites(List<UserModel> favorites) async {
    final String favoritesJson = favorites.map((user) => user.toJson()).join(',');
    await _storage.write(key: favoritesKey, value: favoritesJson);
  }
}

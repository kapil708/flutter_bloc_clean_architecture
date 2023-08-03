import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/exceptions.dart';

abstract class LocalDataSource {
  Future<bool> isLogin();
  String? getAuthToken();
  Future<void> removeAuthToken();
  Future<void> cacheAuthToken(String authToken);
  Future<void> cacheLanguage(String languageCode);
  String? getLanguage();
  Future<void> cacheThemeMode(String themeModeName);
  String? getThemeMode();
}

const _authToken = "authToken";
const _languagePrefs = "languagePrefs";
const _themePrefs = "themePrefs";

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> isLogin() {
    try {
      final String? jsonString = sharedPreferences.getString(_authToken);
      if (jsonString != null) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on Exception catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheAuthToken(String authToken) {
    return sharedPreferences.setString(_authToken, authToken);
  }

  @override
  Future<void> cacheLanguage(String languageCode) {
    return sharedPreferences.setString(_languagePrefs, languageCode);
  }

  @override
  Future<void> cacheThemeMode(String themeModeName) {
    return sharedPreferences.setString(_themePrefs, themeModeName);
  }

  @override
  Future<void> removeAuthToken() {
    return sharedPreferences.remove(_authToken);
  }

  @override
  String? getAuthToken() {
    try {
      final String? jsonString = sharedPreferences.getString(_authToken);
      return jsonString;
    } on Exception catch (e) {
      throw CacheException();
    }
  }

  @override
  String? getLanguage() {
    try {
      final String? jsonString = sharedPreferences.getString(_languagePrefs);
      return jsonString;
    } on Exception catch (e) {
      throw CacheException();
    }
  }

  @override
  String? getThemeMode() {
    try {
      final String? jsonString = sharedPreferences.getString(_themePrefs);
      return jsonString;
    } on Exception catch (e) {
      throw CacheException();
    }
  }
}

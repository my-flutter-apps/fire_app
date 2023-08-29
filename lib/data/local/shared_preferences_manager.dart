


import 'package:fire_app/data/local/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _sharedPrefs;

  getInstance() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  /// User Authorization access
  String get authorization =>
      _sharedPrefs?.getString(SharedPreferencesKeys.authorization) ?? "";

  set authorization(String value) {
    _sharedPrefs?.setString(SharedPreferencesKeys.authorization, value);
  }

  void updateAuthorization(String value) {
    if (_sharedPrefs?.containsKey(SharedPreferencesKeys.authorization) ??
        false) {
      _sharedPrefs?.remove(SharedPreferencesKeys.authorization);
    }
    _sharedPrefs?.setString(SharedPreferencesKeys.authorization, value);
  }

  void removeAuthorization() {
    if (_sharedPrefs?.containsKey(SharedPreferencesKeys.authorization) ??
        false) {
      _sharedPrefs?.remove(SharedPreferencesKeys.authorization);
    }
  }


  /// User token
  String get token =>
      _sharedPrefs?.getString(SharedPreferencesKeys.token) ?? "";

  set token(String value) {
    _sharedPrefs?.setString(SharedPreferencesKeys.token, value);
  }

  void updateToken(String value) {
    if (_sharedPrefs?.containsKey(SharedPreferencesKeys.token) ?? false) {
      _sharedPrefs?.remove(SharedPreferencesKeys.token);
    }
    _sharedPrefs?.setString(SharedPreferencesKeys.token, value);
  }

  void removeToken() {
    if (_sharedPrefs?.containsKey(SharedPreferencesKeys.token) ?? false) {
      _sharedPrefs?.remove(SharedPreferencesKeys.token);
    }
  }

  removeAll() {
    removeAuthorization();
    removeToken();
  }
}
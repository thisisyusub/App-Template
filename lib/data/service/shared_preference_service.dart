import 'package:our_apps_template/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<void> persistUserToken(String token) async =>
      await _preferences.setString(SharedPrefKeys.token, token);

  String get userToken => _preferences.getString(SharedPrefKeys.token);

  Future<void> persistUserId(int id) async =>
      await _preferences.setInt(SharedPrefKeys.id, id);

  int get userId => _preferences.getInt(SharedPrefKeys.id);

  Future<void> setUserLogInfo([bool isLogged = false]) async =>
      await _preferences.setBool(SharedPrefKeys.loggedIn, isLogged);

  bool get isUserLogged => _preferences.getBool(SharedPrefKeys.loggedIn);

  Future<void> setDarkModeInfo([bool isDarkModeEnabled = false]) async =>
      await _preferences.setBool(
          SharedPrefKeys.darkModeEnabled, isDarkModeEnabled);

  bool get isDarkModeEnabled =>
      _preferences.getBool(SharedPrefKeys.darkModeEnabled);

  Future<void> setLanguage(String langCode) async =>
      await _preferences.setString(SharedPrefKeys.languageCode, langCode);

  String get languageCode =>
      _preferences.getString(SharedPrefKeys.languageCode);

  Future<void> setUsername(String userName) async =>
      await _preferences.setString(SharedPrefKeys.username, userName);

  String get username => _preferences.getString(SharedPrefKeys.username);

  Future<void> setUserEmail(String email) async =>
      await _preferences.setString(SharedPrefKeys.email, email);

  String get userEmail => _preferences.getString(SharedPrefKeys.email);
}

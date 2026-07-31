import 'package:dokan_khata_bd/core/constants/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStartupService {
  Future<bool> isLanguageSelected() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(AppKeys.languageCode);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(AppKeys.isLoggedIn) ?? false;
  }

  Future<bool> hasCreatedPin() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(AppKeys.pinCreated) ?? false;
  }
}
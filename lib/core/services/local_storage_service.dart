import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService._();

  static const String _pinKey = "user_pin";
  static const String _mobileKey = "user_mobile";
  static const String _languageKey = "language";
  static const String _shopSetupKey = "shop_setup_completed";

  // ==========================
  // PIN
  // ==========================

  static Future<void> savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pinKey, pin);
  }

  static Future<String?> getPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pinKey);
  }

  static Future<void> removePin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pinKey);
  }

  // ==========================
  // Mobile Number
  // ==========================

  static Future<void> saveMobileNumber(String mobile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_mobileKey, mobile);
  }

  static Future<String?> getMobileNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_mobileKey);
  }

  static Future<void> removeMobileNumber() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_mobileKey);
  }

  // ==========================
  // Language
  // ==========================

  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }

  // ==========================
  // Shop Setup
  // ==========================

  static Future<void> setShopSetupCompleted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_shopSetupKey, value);
  }

  static Future<bool> isShopSetupCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_shopSetupKey) ?? false;
  }

  // ==========================
  // Logout / Reset App
  // ==========================

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
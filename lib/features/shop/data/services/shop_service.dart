import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/shop_model.dart';

class ShopService {
  ShopService._();

  static const _shopKey = 'shop_profile';

  static Future<void> saveShop(ShopModel shop) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _shopKey,
      jsonEncode(shop.toMap()),
    );
  }

  static Future<ShopModel?> getShop() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(_shopKey);

    if (json == null) return null;

    return ShopModel.fromMap(
      jsonDecode(json),
    );
  }

  static Future<bool> hasShop() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(_shopKey);
  }

  static Future<void> clearShop() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_shopKey);
  }
}
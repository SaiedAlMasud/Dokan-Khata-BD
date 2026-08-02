import 'package:dokan_khata_bd/features/shop/data/models/shop_model.dart';
import 'package:dokan_khata_bd/features/shop/data/services/shop_service.dart';

class DashboardController {
  DashboardController._();

  static Future<ShopModel?> loadShop() async {
    return ShopService.getShop();
  }
}
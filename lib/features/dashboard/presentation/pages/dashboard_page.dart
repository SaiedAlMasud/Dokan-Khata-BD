import 'package:dokan_khata_bd/features/dashboard/controllers/dashboard_controller.dart';
import 'package:dokan_khata_bd/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:dokan_khata_bd/features/dashboard/presentation/widgets/quick_action_card.dart';
import 'package:dokan_khata_bd/features/dashboard/presentation/widgets/section_title.dart';
import 'package:dokan_khata_bd/features/dashboard/presentation/widgets/summary_card.dart';
import 'package:dokan_khata_bd/features/shop/data/models/shop_model.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  ShopModel? _shop;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadShop();
  }

  Future<void> _loadShop() async {
    _shop = await DashboardController.loadShop();

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardHeader(
            ownerName: _shop?.ownerName ?? "",
            shopName: _shop?.shopName ?? "",
          ),

          const SizedBox(height: 24),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: const [
              SummaryCard(
                icon: Icons.attach_money,
                title: "Today's Sales",
                value: "৳ 0",
                color: Colors.green,
              ),
              SummaryCard(
                icon: Icons.inventory,
                title: "Products",
                value: "0",
                color: Colors.blue,
              ),
              SummaryCard(
                icon: Icons.people,
                title: "Customers",
                value: "0",
                color: Colors.orange,
              ),
              SummaryCard(
                icon: Icons.warning_amber,
                title: "Low Stock",
                value: "0",
                color: Colors.red,
              ),
            ],
          ),

          const SizedBox(height: 30),

          const SectionTitle(
            title: "Quick Actions",
          ),

          const SizedBox(height: 15),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              QuickActionCard(
                icon: Icons.point_of_sale,
                title: "New Sale",
                onTap: () {},
              ),
              QuickActionCard(
                icon: Icons.add_box,
                title: "Add Product",
                onTap: () {},
              ),
              QuickActionCard(
                icon: Icons.person_add,
                title: "Customer",
                onTap: () {},
              ),
              QuickActionCard(
                icon: Icons.local_shipping,
                title: "Supplier",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
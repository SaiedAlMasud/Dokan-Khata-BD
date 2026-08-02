import 'package:dokan_khata_bd/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:dokan_khata_bd/features/more/presentation/pages/more_page.dart';
import 'package:dokan_khata_bd/features/products/presentation/pages/products_page.dart';
import 'package:dokan_khata_bd/features/reports/presentation/pages/reports_page.dart';
import 'package:dokan_khata_bd/features/sales/presentation/pages/sales_page.dart';
import 'package:dokan_khata_bd/shared/layout/app_shell.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    ProductsPage(),
    SalesPage(),
    ReportsPage(),
    MorePage(),
  ];

  final List<String> _titles = const [
    "Dashboard",
    "Products",
    "Sales",
    "Reports",
    "More",
  ];

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: _titles[_currentIndex],
      currentIndex: _currentIndex,
      onDestinationSelected: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      body: _pages[_currentIndex],
    );
  }
}
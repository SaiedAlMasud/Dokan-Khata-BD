import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final String title;

  const AppShell({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
      ),
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: "Products",
          ),
          NavigationDestination(
            icon: Icon(Icons.point_of_sale_outlined),
            selectedIcon: Icon(Icons.point_of_sale),
            label: "Sales",
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: "Reports",
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: "More",
          ),
        ],
      ),
    );
  }
}
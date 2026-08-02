import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final String ownerName;
  final String shopName;

  const DashboardHeader({
    super.key,
    required this.ownerName,
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome 👋",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            ownerName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            shopName,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
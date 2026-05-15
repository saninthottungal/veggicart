import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AdminBottomNav extends StatelessWidget {
  const AdminBottomNav({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(LucideIcons.house),
            label: "Home",
          ),

          NavigationDestination(
            icon: Icon(LucideIcons.vegan),
            label: "Vegetables",
          ),

          NavigationDestination(
            icon: Icon(LucideIcons.shoppingBag),
            label: "Orders",
          ),
        ],
        onDestinationSelected: navigationShell.goBranch,
      ),
    );
  }
}

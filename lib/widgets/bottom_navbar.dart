import 'package:ksu_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppConstants.secondaryColor,
      items: [
          _buildNavItem('Chatbot', Icons.chat),
          _buildNavItem('Home', Icons.home),
          _buildNavItem('Profile', Icons.person),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color.fromARGB(255, 95, 95, 95),
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }

  BottomNavigationBarItem _buildNavItem(
    String label,
    IconData icon,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(icon),
      label: label,
      );
  }
}

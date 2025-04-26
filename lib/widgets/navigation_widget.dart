import 'package:ksu_app/constants/app_constants.dart';
import 'package:ksu_app/screens/chatbot_screen.dart';
import 'package:ksu_app/screens/home_screen.dart';
import 'package:ksu_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int _currentIndex = 1;

    final List<Widget> _pages = [
    const ChatbotScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.mainColor,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
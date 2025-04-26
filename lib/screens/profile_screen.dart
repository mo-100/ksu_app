import 'package:ksu_app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use mock profile data
    final UserProfile profile = UserProfile.mockProfile();
    
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        color: AppConstants.mainColor, // Dark background color
        child: Column(
          children: [
            const SizedBox(height: 30),
            // User name
            Text(
              profile.name,
              style: const TextStyle(
                color: AppConstants.secondaryTextColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Profile information sections
            _buildInfoItem(
              context: context,
              icon: Icons.person_outline,
              title: 'اسم الطالب',
              value: profile.name,
            ),
            _buildDivider(),
            _buildInfoItem(
              context: context,
              icon: Icons.email_outlined,
              title: 'البريد الإلكتروني',
              value: profile.email,
            ),
            _buildDivider(),
            _buildInfoItem(
              context: context,
              icon: Icons.phone_outlined,
              title: 'ؤقم الجوال',
              value: profile.phone,
            ),
            _buildDivider(),
            _buildInfoItem(
              context: context,
              icon: Icons.book,
              title: 'المعدل التراكمي',
              value: profile.gpa,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Divider(
        color: Color(0xFF2A2A3A),
        thickness: 1,
      ),
    );
  }

  Widget _buildInfoItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppConstants.secondaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              icon,
              color: AppConstants.iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppConstants.secondaryTextColor,
                    fontSize: 14,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: AppConstants.secondaryTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppConstants.iconColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}

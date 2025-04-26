import 'package:ksu_app/constants/app_constants.dart';
import 'package:ksu_app/models/user_profile.dart';
import 'package:ksu_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.mainColor,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // No Schedule Text
            const Text(
              "صفحة الطالب",
              style: TextStyle(
                color: AppConstants.secondaryTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "الطالب",
              style: TextStyle(
                color: AppConstants.secondaryTextColor,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "المعدل التراكمي: ${UserProfile.mockProfile().gpa}",
              style: TextStyle(
                color: AppConstants.secondaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "الكلية: ${UserProfile.mockProfile().college}",
              style: TextStyle(
                color: AppConstants.secondaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            

            const SizedBox(height: 16),

            CategoryDivider(name: 'الطلبات الإلكترونية'),

            const SizedBox(height: 10),

            
            const SizedBox(height: 20),

            CategoryDivider(name: 'التقارير'),

            const SizedBox(height: 10),
            

            const Text(
              "جدول الطالب",
              style: TextStyle(
                color: AppConstants.secondaryTextColor,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/schedule2.jpg')
          ],
        ),
      ),
    );
  }
}

class CategoryDivider extends StatelessWidget {
  final String name;

  const CategoryDivider({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppConstants.secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            name,
            style: TextStyle(color: AppConstants.secondaryTextColor, fontWeight: FontWeight.w500),
          ),
        ),
        const Spacer(),
        const Icon(Icons.chevron_right, color: AppConstants.iconColor),
      ],
    );
  }
}

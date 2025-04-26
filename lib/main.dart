import 'package:ksu_app/constants/app_constants.dart';
import 'package:ksu_app/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppConstants.theme,
      home: const NavigationWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

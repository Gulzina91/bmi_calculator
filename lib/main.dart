import 'package:bmi_calculator/bmi_screen.dart';
import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: AppColors.white,
            fontSize: 48,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(color: AppColors.white),
          titleLarge: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          headlineMedium: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        useMaterial3: true,
      ),
      home: const BmiScreen(),
    );
  }
}

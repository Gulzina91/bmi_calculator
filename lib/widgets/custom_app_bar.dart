import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      title: Text(
        title.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.pinkDark,
              AppColors.greyBlueDarker,
              AppColors.pinkDark,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}

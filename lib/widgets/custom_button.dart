import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: const BoxDecoration(color: AppColors.pinkDark),
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

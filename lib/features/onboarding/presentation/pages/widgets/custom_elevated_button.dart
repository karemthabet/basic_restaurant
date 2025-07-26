
import 'package:basic_restaurant/core/utils/colors/app_colors.dart';
import 'package:basic_restaurant/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.onPressed, required this.text,
  });
  final String text;
final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
       
       onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       minimumSize: const Size(157,57),
       backgroundColor: AppColors.redColor,
       foregroundColor: AppColors.whiteColor,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
       child: Text(text,style: AppStyles.textTheme.bodyLarge,)),
    );
  }
}


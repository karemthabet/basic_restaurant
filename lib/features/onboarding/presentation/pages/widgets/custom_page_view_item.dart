
import 'package:basic_restaurant/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomItemPageView extends StatelessWidget {
  const CustomItemPageView({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            )),
        const SizedBox(
          height: 20,
        ),
        Text(
          subtitle,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.subtitle),
        ),
      ],
    );
  }
}

import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/features/onboarding/data/model/on_bording_model.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomPageView extends StatelessWidget {
  final OnBoardingModel model;
  final VoidCallback onNext;
  final bool isLast;

  const CustomPageView({
    super.key,
    required this.model,
    required this.onNext,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(model.image),
          const Spacer(),
          Text(
            model.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            model.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          CustomElevatedButton(
            text: isLast ? "Get Started" : "Next",
            onPressed: () {
              if (isLast) {
                GoRouter.of(context).go(RoutesName.auth);
              } else {
                onNext();
              }
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => GoRouter.of(context).go(RoutesName.auth),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

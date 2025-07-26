import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingPageBody extends StatelessWidget {
  const OnBoardingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            CustomPageView(),
         
        ],
      ),
    );
  }
}

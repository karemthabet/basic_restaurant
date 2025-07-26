import 'package:basic_restaurant/core/utils/assets/app_assets.dart';
import 'package:basic_restaurant/features/onboarding/data/model/on_bording_model.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingPageBody extends StatefulWidget {
  const OnBoardingPageBody({super.key});

  @override
  State<OnBoardingPageBody> createState() => _OnBoardingPageBodyState();
}

class _OnBoardingPageBodyState extends State<OnBoardingPageBody> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      image:AppAssets.boardingOne,
      title: 'Welcome',
      subtitle: 'Welcome to our restaurant app',
    ),
    OnBoardingModel(
      image: AppAssets.boardingTwo,
      title: 'Browse',
      subtitle: 'Browse and pick your favorite meals',
    ),
    
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: pages.length,
      onPageChanged: (index) {
        setState(() => currentIndex = index);
      },
      itemBuilder: (context, index) {
        return CustomPageView(
          model: pages[index],
          onNext: nextPage,
          isLast: index == pages.length - 1,
        );
      },
    );
  }
}

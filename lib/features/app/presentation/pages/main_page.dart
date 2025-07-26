import 'package:basic_restaurant/features/app/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:basic_restaurant/features/home/presentation/pages/add_to_cart_page.dart';
import 'package:basic_restaurant/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;

  const MainPage({super.key, this.initialIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomePage(),
    AddToCartPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
      ),
    );
  }
}

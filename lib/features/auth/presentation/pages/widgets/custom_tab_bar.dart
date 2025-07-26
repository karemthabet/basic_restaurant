
import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.pink,
      labelColor: Colors.pink,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      tabs: [
        Tab(child: Text("Create Account")),
        Tab(child: Text("Login")),
      ],
    );
  }
}
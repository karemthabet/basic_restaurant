import 'package:basic_restaurant/features/auth/presentation/pages/widgets/custom_tab_bar.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/widgets/log_in_form.dart';
import 'package:basic_restaurant/features/auth/presentation/pages/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:basic_restaurant/core/utils/assets/app_assets.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.boardingTwo,
                  height: MediaQuery.of(context).size.height * .3,
                ),
                const CustomTabBarWidget(),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 500,
                  child: TabBarView(
                    children: [
                     SignUpForm(),
                      LogInForm(),
                    ],
                  ),

                ),
  
              ],
            ),
          ),
        ),
      ),
    );
  }
}






class MainButtonWidget extends StatelessWidget {
  final String text;
  final Color color;

  const MainButtonWidget({
    super.key,
    required this.text,
    this.color = Colors.pink,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text),
    );
  }
}

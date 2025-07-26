import 'package:basic_restaurant/core/utils/assets/app_assets.dart';
import 'package:basic_restaurant/features/onboarding/presentation/pages/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 30),
        child: Column(children: [
Image.asset(AppAssets.lock),
          // CustomTextFormFieldWidget(label: 'Password'),
          const SizedBox(height: 20,),
                // CustomTextFormFieldWidget(label: 'New Password'),
        const Spacer(),
        CustomElevatedButton(onPressed: (){}, text: "Confirm")
        ],),
      ),
    );
  }
}
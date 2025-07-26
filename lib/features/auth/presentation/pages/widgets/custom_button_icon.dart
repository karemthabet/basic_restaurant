
import 'package:basic_restaurant/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        icon: const Icon(FontAwesomeIcons.google),
        label:  Text("Login with Google",style: AppStyles.textTheme.bodyMedium,),
      ),
    );
  }
}

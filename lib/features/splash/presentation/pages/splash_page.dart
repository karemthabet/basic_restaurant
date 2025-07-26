import 'package:basic_restaurant/core/utils/assets/app_assets.dart';
import 'package:basic_restaurant/core/utils/colors/app_colors.dart';
import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
Future.delayed(const Duration(seconds: 2,),(){
  if(mounted){
  GoRouter.of(context).push(RoutesName.onBoarding);

  }
});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset(AppAssets.splashLogo,fit: BoxFit.cover,),const Text("Food Couriers",style: TextStyle(fontSize: 45,color: AppColors.redColor,fontWeight: FontWeight.w900),)],));
  }
}
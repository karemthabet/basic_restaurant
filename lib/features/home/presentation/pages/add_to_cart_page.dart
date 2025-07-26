import 'package:basic_restaurant/core/services/service_locator.dart';
import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';
import 'package:basic_restaurant/features/home/presentation/widgets/add_to_cart_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeCubit>()..listenToCart(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart'),centerTitle: true,),
        body: const AddToCartPageBody(),
      ),
    );
  }
}

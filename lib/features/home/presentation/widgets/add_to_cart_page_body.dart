import 'package:basic_restaurant/features/home/presentation/widgets/list_view_cart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';

class AddToCartPageBody extends StatefulWidget {
  const AddToCartPageBody({super.key});

  @override
  State<AddToCartPageBody> createState() => _AddToCartPageBodyState();
}

class _AddToCartPageBodyState extends State<AddToCartPageBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeCartSuccess || current is HomeError,
      builder: (context, state) {
        if (state is HomeCartSuccess) {
          final cartItems = state.cartItems;
          if (cartItems.isEmpty) {
            return const Center(
              child: Text(
                "Cart is empty",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return  ListViewCartItems(cartItems: cartItems,);
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

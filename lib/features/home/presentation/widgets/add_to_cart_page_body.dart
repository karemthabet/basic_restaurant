import 'package:basic_restaurant/core/utils/router/routes_name.dart';
import 'package:basic_restaurant/features/home/presentation/widgets/list_view_cart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart'; // تأكد أنك أضفتها

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

          return Column(
            children: [
              Expanded(child: ListViewCartItems(cartItems: cartItems)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    if(context.mounted){
                      
                      context.go(RoutesName.auth);
                    }
                    
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

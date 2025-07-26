import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';
import 'package:basic_restaurant/features/home/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeSuccess || current is HomeError,
      
      builder: (context, state) {
        if (state is HomeSuccess) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];

                return CardItem(product: product);
              },
            ),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
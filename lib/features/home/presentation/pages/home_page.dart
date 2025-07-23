import 'package:basic_restaurant/core/services/service_locator.dart';
import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';
import 'package:basic_restaurant/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              context.read<HomeCubit>().getProducts();
            }),
            body: const HomePageBody(),
          );
        }
      ),
    );
  }
}

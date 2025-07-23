import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());
    final result = await homeRepo.getHomeData();
    result.fold(
      (failure) => emit(HomeError(message: failure.errMessage)),
      (products) => emit(HomeSuccess(products: products)),
    );
  }
}

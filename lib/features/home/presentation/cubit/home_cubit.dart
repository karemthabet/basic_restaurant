import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

Future<void> streamProducts() async {
  emit(HomeLoading());
  homeRepo.getHomeDataStream().listen(
    (products) => emit(HomeSuccess(products: products)),
    onError: (error) => emit(HomeError(message: error.toString())),
  );
}


  Future<void> addToCart({required ProductModel product}) async {
    var result = await homeRepo.addToCart(product: product);
    result.fold(
      (failure) => emit(HomeError(message: failure.errMessage)),
      (r) => emit(HomeCartSuccess()),
    );
  }

  Future<void> deleteProduct({required String documentId}) async {
    var result = await homeRepo.removeFromCart(documentId: documentId);
    result.fold(
      (failure) => emit(HomeError(message: failure.errMessage)),
      (r) => emit(HomeCartSuccess()),
    );
  }
}

import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:basic_restaurant/features/home/data/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await homeRepo.getHomeData();
    result.fold(
      (failure) => emit(HomeError(message: failure.errMessage)),
      (products) => emit(HomeSuccess(products: products)),
    );
  }

  // void listenToCart() {
  //   _cartStream = homeRepo.getCartDataStream();
  //   _cartStream?.listen((cartItems) {
  //     emit(HomeCartSuccess(cartItems: cartItems));
  //   });
  // }

  Future<void> addToCart(ProductModel product) async {
    await homeRepo.addToCart( product:  product);
  }

  // Future<void> deleteProduct({required String documentId}) async {
  //   await homeRepo.deleteItemFromCart(documentId: documentId);
  // }
 
}
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

void listenToCart() {
  emit(HomeCartLoading());

  homeRepo.getCartDataStream().listen((cartProducts) {
    try {
      emit(HomeCartSuccess(cartItems: cartProducts));
    } catch (e) {
      emit(HomeCartError(message: "Error loading cart: $e"));
    }
  });
}
  Future<void> addToCart(ProductModel product) async {
    emit(HomeLoading());
    final result = await homeRepo.addToCart(product: product);
    result.fold((failure) => emit(HomeError(message: failure.errMessage)), (_) {});}
Future<void> removeFromCart(String productId) async {
  emit(HomeCartLoading());

  final result = await homeRepo.removeFromCart(productId);
  result.fold(
    (failure) => emit(HomeCartError(message: failure.errMessage)),
    (_) {
    },
  );
}

 
 
}
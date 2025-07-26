part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductModel> products;
  HomeSuccess({required this.products});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

class HomeCartSuccess extends HomeState {
  final List<ProductModel> cartItems;
  HomeCartSuccess({required this.cartItems});
}

class HomeUpdateSuccess extends HomeState {}

class HomeRemoveSuccess extends HomeState {
  final List<ProductModel> cartItems;
  HomeRemoveSuccess({required this.cartItems});
}

class HomeCartLoading extends HomeState {}

class HomeCartError extends HomeState {
  final String message;
  HomeCartError({required this.message});
}
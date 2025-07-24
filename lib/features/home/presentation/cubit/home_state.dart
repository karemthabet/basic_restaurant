part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductModel> products;
  HomeSuccess({required this.products});
}

class HomeError extends HomeState {
  String message;
  HomeError({required this.message});
}

class HomeCartSuccess extends HomeState {}
class HomeRemoveSuccess extends HomeState {}

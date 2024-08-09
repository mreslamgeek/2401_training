part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {}

final class CartAddedProduct extends CartState {
  final Product newProduct;

  CartAddedProduct({required this.newProduct});
}

final class CartProductIncremented extends CartState {
  final Product newProduct;

  CartProductIncremented({required this.newProduct});
}

final class CartProductDecremented extends CartState {
  final Product newProduct;

  CartProductDecremented({required this.newProduct});
}

final class CartCleared extends CartState {}

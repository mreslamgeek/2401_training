part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class Loading extends HomeState {}

final class CategoryLoaded extends HomeState {}

final class ProductsLoaded extends HomeState {}

final class ProductsCleared extends HomeState {}

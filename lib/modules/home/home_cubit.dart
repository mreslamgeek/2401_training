import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/category.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/data/repos/categories_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Loading()) {
    getAllCategories().then(
      (value) {
        if (categories?.first.id != null) {
          getSingleCategory(categories!.first.id!);
        }
      },
    );
  }

  List<Category>? categories;
  List<Product>? products;

  Future getAllCategories() async {
    categories = await CategoriesRepoApi.getAllCategories();

    emit(CategoryLoaded());
  }

  void getSingleCategory(int id) async {
    products = null;
    emit(ProductsCleared());

    products = await CategoriesRepoApi.getCategoryProducts(id);
    emit(ProductsLoaded());
  }

  Category? findCategory(int id) {
    final productCat =
        categories!.firstWhere((element) => element.id == id, orElse: () => Category(id: 0));

    if (productCat.id == 0) {
      return null;
    }
    return productCat;
  }
}

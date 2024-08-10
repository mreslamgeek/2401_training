import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/product.dart';
import 'package:flutter_application_1/data/repos/cart_repo.dart';
import 'package:flutter_application_1/utils/toast_helper.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoading()) {
    getCart();
  }

  List<Product> cartProducts = [];

  Future getCart() async {
    return CartRepoApi.getCart().then(
      (value) {
        if (value != null) {
          cartProducts = value;
          emit(CartLoaded());
        }
      },
    );
  }

  Future emptyCart() async {
    return CartRepoApi.deleteAllCart().then(
      (value) {
        if (value == true) {
          cartProducts = [];
          emit(CartCleared());
        }
      },
    );
  }

  void addProductToCart(Product item) {
    CartRepoApi.addToCart([item]).then(
      (value) {
        if (value != null) {
          cartProducts = value;
          emit(CartAddedProduct(newProduct: item));
        } else {
          showErrorToast('Product is already exist');
        }
      },
    );
  }

  void updateCart(Product item) {
    final existingItem = checkIfProductInCart(item.id!);

    CartRepoApi.updateCart([item]).then(
      (value) {
        if (value != null) {
          cartProducts = value;

          if (existingItem!.pivot!.quantity! < item.pivot!.quantity!) {
            emit(CartProductIncremented(newProduct: item));
          } else {
            emit(CartProductDecremented(newProduct: item));
          }
        } else {
          showErrorToast('Product is already exist');
        }
      },
    );
  }

  Product? checkIfProductInCart(int productId) {
    return cartProducts.firstWhereOrNull((element) => element.id == productId);
  }

  double getTotalCost() {
    if (cartProducts.isEmpty) return 0;

    var count = 0.0;

    for (var productInCar in cartProducts) {
      int quntity = productInCar.pivot!.quantity!;

      count += quntity * productInCar.price!;
    }

    return count;
  }
}

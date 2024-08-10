import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/order.dart';
import 'package:flutter_application_1/data/repos/order_repo.dart';
import 'package:flutter_application_1/global/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderLoading()) {
    getAllOrders();
  }

  List<Order> orders = [];

  void getAllOrders() {
    OrderRepoApi.getAllOrders().then(
      (value) {
        if (value != null) {
          orders = value;
          emit(OrderLoaded());
        }
      },
    );
  }

  void placeOrder(BuildContext context) async {
    var cartProducts = context.read<CartCubit>().cartProducts;

    OrderRepoApi.placeOrder(cartProducts).then(
      (value) {
        if (value != null) {
          getAllOrders();
          context.read<CartCubit>().emptyCart();
          emit(NewOrderCreated(order: value));
        }
      },
    );
  }

  int getOrderTotalQuntity(Order order) {
    if (order.products?.isEmpty == true) return 0;

    var count = 0;

    for (var product in order.products!) {
      var productCount = product!.pivot!.quantity!;
      count += productCount;
    }
    return count;
  }

  double getOrderTotalCost(Order order) {
    if (order.products?.isEmpty == true) return 0;

    var count = 0.0;

    for (var product in order.products!) {
      var productCount = product!.pivot!.quantity!;

      count += productCount * product.price!;
    }
    return count;
  }
}

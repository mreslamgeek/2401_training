import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/order/cubit/order_cubit.dart';
import 'package:flutter_application_1/modules/order/widgets/order_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (context.read<OrderCubit>().orders.isEmpty) {
            return const Center(child: Text('No Orders, Start creating an order.'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              return context.read<OrderCubit>().getAllOrders();
            },
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: context.read<OrderCubit>().orders.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return OrderListItem(
                  order: context.read<OrderCubit>().orders[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

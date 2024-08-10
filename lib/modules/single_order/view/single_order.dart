import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/order.dart';
import 'package:flutter_application_1/modules/order/cubit/order_cubit.dart';
import 'package:flutter_application_1/modules/single_order/widgets/order_proudct_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SingleOrderView extends StatelessWidget {
  const SingleOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as Order;

    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormat.yMd().add_jm().format(order.createdAt!),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // color: Color(0xff6342E8),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    '\$${context.read<OrderCubit>().getOrderTotalCost(order)}',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        color: Color(0xff6342E8), fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Order Products',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    OrderProductListItem(item: order.products![index]!),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: order.products!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

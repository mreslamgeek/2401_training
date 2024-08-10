// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/data/models/order.dart';
// import 'package:flutter_application_1/data/models/product.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_application_1/modules/home/home_cubit.dart';
// import 'package:flutter_application_1/routes/app_routes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class OrderListItem extends StatelessWidget {
//   final Order order;
//   const OrderListItem({super.key, required this.order});

//   @override
//   Widget build(BuildContext context) {
//     // var cat = context.read<HomeCubit>().findCategory(item.categoryId!);

//     return GestureDetector(
//       onTap: () {
//         navKey.currentState?.pushNamed(AppRoutes.SINGLEPRODUCT, arguments: item);
//       },
//       child: Container(
//         height: 150,
//         padding: const EdgeInsets.all(12),
//         clipBehavior: Clip.antiAlias,
//         decoration:
//             BoxDecoration(color: const Color(0xffF1F4FB), borderRadius: BorderRadius.circular(24)),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 order.image ?? '',
//                 width: MediaQuery.of(context).size.width * 0.3,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     item.name ?? '',
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xff6342E8),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     cat?.name ?? '',
//                     style: const TextStyle(color: Color(0xffA1A1A1)),
//                   ),
//                   Expanded(child: Text('${item.pivot?.quantity}')
//                       //  QuantitySelector(
//                       //   quantity: item.pivot?.quantity ?? 1,
//                       //   // onIncrement: (int newQuntity) {
//                       //   //   item.pivot = Pivot(quantity: newQuntity);
//                       //   //   context.read<CartCubit>().updateCart(item);
//                       //   // },
//                       //   // onDecrement: (int newQuntity) {
//                       //   //   item.pivot = Pivot(quantity: newQuntity);
//                       //   //   context.read<CartCubit>().updateCart(item);
//                       //   // },
//                       // )
//                       ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 8),
//             Text(
//               '\$${item.price}',
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/order.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/modules/order/cubit/order_cubit.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navKey.currentState?.pushNamed(AppRoutes.SINGLEORDER, arguments: order);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(color: const Color(0xffF1F4FB), borderRadius: BorderRadius.circular(24)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMd().add_jm().format(order.createdAt!),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // color: Color(0xff6342E8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${context.read<OrderCubit>().getOrderTotalQuntity(order)}',
                    style: const TextStyle(color: Color(0xffA1A1A1)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '\$${context.read<OrderCubit>().getOrderTotalCost(order)}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff6342E8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

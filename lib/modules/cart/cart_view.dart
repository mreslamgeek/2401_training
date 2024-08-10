import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter_application_1/modules/Debit_card/Debit_card.dart';
import 'package:flutter_application_1/modules/cart/single_cart_item.dart';
import 'package:flutter_application_1/modules/order/cubit/order_cubit.dart';
import 'package:flutter_application_1/modules/sign_in/signin_cubit.dart';
import 'package:flutter_application_1/utils/toast_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is NewOrderCreated) {
          showSuccessToast('Order Placed Successfully');
        }
      },
      child: Scaffold(
        floatingActionButton: BlocBuilder<CartCubit, CartState>(
          builder: (_, __) {
            if (context.read<CartCubit>().cartProducts.isEmpty) {
              return const SizedBox.shrink();
            }
            return _buildPlaceOrderButton(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text(
            'My  Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          scrolledUnderElevation: 0,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => context.read<CartCubit>().emptyCart(),
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (context.read<CartCubit>().cartProducts.isEmpty) {
              return const Center(child: Text('No Procuts in cart, Start adding them.'));
            }
            return RefreshIndicator(
              onRefresh: () async {
                return context.read<CartCubit>().getCart();
              },
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: context.read<CartCubit>().cartProducts.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return CartListItem(item: context.read<CartCubit>().cartProducts[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox _buildPlaceOrderButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff6342E8),
          onPressed: () {
            context.read<OrderCubit>().placeOrder(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              const Text(
                'Place Order',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: const Color(0xff472CB6), borderRadius: BorderRadius.circular(8)),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) => Text(
                    '${context.read<CartCubit>().getTotalCost()}\$',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Checkout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Delivery',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text('Select Method     '),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            )),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pament',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) => const DebitCard()));
                            },
                            child: Image.asset('assets/icons/Group 6868.png'))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Promo Code',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text('Pick discount     '),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            )),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Cost',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text('135.96     '),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('By placing an order you agree to our \n Terms And Conditions.')
                  ],
                ),
              ),
            ),
          );
        });
  }
}

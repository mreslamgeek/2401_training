import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int quantity;
  final void Function(int newQuntity) onIncrement;
  final void Function(int newQuntity) onDecrement;

  const QuantitySelector(
      {super.key, required this.quantity, required this.onIncrement, required this.onDecrement});

  @override
  QuantitySelectorState createState() => QuantitySelectorState();
}

class QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  void didUpdateWidget(covariant QuantitySelector oldWidget) {
    if (quantity != widget.quantity) {
      setState(() {
        quantity = widget.quantity;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF1F4FB),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          IconButton(
            onPressed: () {
              decrementQuantity();
              widget.onDecrement(quantity);
            },
            icon: const Icon(Icons.remove),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          // const SizedBox(width: 22),
          Expanded(
            flex: 5,
            child: Text(
              '$quantity',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () {
              incrementQuantity();
              widget.onIncrement(quantity);
            },
            icon: const Icon(Icons.add),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

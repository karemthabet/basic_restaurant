import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:basic_restaurant/features/home/presentation/widgets/custom_card_item.dart';
import 'package:flutter/material.dart';

class ListViewCartItems extends StatefulWidget {
  const ListViewCartItems({super.key, required this.cartItems});
  final List<ProductModel> cartItems;

  @override
  State<ListViewCartItems> createState() => _ListViewCartItemsState();
}

class _ListViewCartItemsState extends State<ListViewCartItems> {
  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.cartItems.fold<double>(
      0.0,
      (sum, item) => sum + item.price,
    );

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: widget.cartItems.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final product = widget.cartItems[index];
              return CustomCardItem(product: product, isInCartPage: true);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black12,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '$totalPrice EGP',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
       
        const SizedBox(height: 20),
      ],
    );
  }
}

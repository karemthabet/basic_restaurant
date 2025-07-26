import 'package:basic_restaurant/core/functions/show_snack_bar_function.dart';
import 'package:basic_restaurant/features/home/data/models/product_model.dart';
import 'package:basic_restaurant/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: product.image,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 70,
                  width: 70,
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 70,
                  width: 70,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${product.price} EGP',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<HomeCubit>().addToCart( product);
                showSnackBarFuction(
                  context,
                  'Added to Cart',
                  isError: false,
                );
              },
              icon: const Icon(
                Icons.add_shopping_cart,
                color: Colors.green,
              ),
              tooltip: 'Add to Cart',
            ),
          ],
        ),
      ),
    );
  }
}
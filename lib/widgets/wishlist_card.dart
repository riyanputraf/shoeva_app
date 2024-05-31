import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/providers/wishlist_provider.dart';
import 'package:shamo_app/theme.dart';

import '../utils/url_util.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    String imageUrl = updateLocalhostUrl(product.galleries[0].url);
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported,
                size: 60,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                ),
                Text('\$${product.price}', style: priceTextStyle),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/button_wishlist_blue.png',
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}

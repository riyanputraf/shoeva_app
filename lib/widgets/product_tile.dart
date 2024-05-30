import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});

  final ProductModel product;

  String updateLocalhostUrl(String url) {
    if (url.contains('localhost')) {
      return url.replaceAll('localhost', '10.0.2.2');
    } else if (url.contains('127.0.0.1')) {
      return url.replaceAll('127.0.0.1', '10.0.2.2');
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = updateLocalhostUrl(product.galleries[0].url);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.image_not_supported,
                  size: 150,
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
                    '${product.category}',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${product.name}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

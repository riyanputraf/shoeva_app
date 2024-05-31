import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

import '../models/product_model.dart';
import '../pages/product_page.dart';
import '../utils/url_util.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    // convert url image from localhost to 10.0.2.2
    String imageUrl = updateLocalhostUrl(product.galleries[0].url);

    // Print the URL to the console for debugging
    print(imageUrl);
    print('Ini galleris: ' + product.galleries[0].url);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: product),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),

            CachedNetworkImage(
              imageUrl: imageUrl,
              width: 215,
              height: 150,
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
            // Image.network(
            //   imageUrl,
            //   width: 215,
            //   height: 150,
            //   fit: BoxFit.cover,
            // ),
            /// Jika API belum selesai uncomment ini
            // Image.asset(
            //   'assets/image_shoes.png',
            //   width: 215,
            //   height: 150,
            //   fit: BoxFit.cover,
            // ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,

                    /// jika api belum selesai
                    // 'Hiking',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,

                    /// jika api blm selesai
                    // 'COURT VISION 2.0',
                    style: blackTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',

                    /// jika api belum selesai
                    // '\$ 58,67',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

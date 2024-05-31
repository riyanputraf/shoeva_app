import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        width: 215.w,
        height: 278.h,
        margin: EdgeInsets.only(
          right: defaultMargin.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: 215.w,
              height: 150.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported,
                size: 150.w,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: secondaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    product.name,
                    style: blackTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 18.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14.sp,
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

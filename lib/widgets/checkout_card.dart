import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamo_app/models/cart_model.dart';
import 'package:shamo_app/theme.dart';

import '../utils/url_util.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key, required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(
        top: 12.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 20.h,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: updateLocalhostUrl(cart.product.galleries[0].url),
              width: 60.w,
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
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: semibold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '\$${cart.product.price}',
                  style: priceTextStyle.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}

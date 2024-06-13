import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/cart_model.dart';
import 'package:shamo_app/providers/cart_provider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/utils/url_util.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: defaultMargin.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: updateLocalhostUrl(cart.product.galleries[0].url),
                  width: 60.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
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
                        fontWeight: semibold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '\$${cart.product.price}',
                      style: priceTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 14.sp,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/button_add.png',
                      width: 16.w,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/button_min.png',
                      width: 16.w,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_remove.png',
                  width: 10.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

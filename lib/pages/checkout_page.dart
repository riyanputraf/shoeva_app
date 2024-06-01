import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/providers/cart_provider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor1,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 24.w,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18.sp,
          ),
        ),
        elevation: 0,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          /// NOTE: List Item
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.sp,
                  ),
                ),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    return Column(
                      children: cartProvider.carts
                          .map(
                            (cart) => CheckoutCard(cart: cart,),
                          )
                          .toList(),
                    );
                  },
                )
              ],
            ),
          ),

          /// Note address detail
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin.h,
            ),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40.w,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: defaultMargin.h,
                          width: 29.w,
                        ),
                        Image.asset(
                          'assets/icon_your_address.png',
                          width: 40.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: secondaryTextStyle.copyWith(
                              fontWeight: light,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'Adidas Core Location',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Text(
                            'Your Address',
                            style: secondaryTextStyle.copyWith(
                              fontWeight: light,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'Marsemoon',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          /// Note Payment Summary
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Container(
                margin: EdgeInsets.only(
                  top: defaultMargin.h,
                ),
                decoration: BoxDecoration(
                  color: bgColor4,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Summary',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Quantity',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '${cartProvider.totalItem()} Items',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Price',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '\$${cartProvider.totalPrice()}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          'Free',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: subtitleTextColor,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: priceTextStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: semibold,
                          ),
                        ),
                        Text(
                          '\$${cartProvider.totalPrice()}',
                          style: priceTextStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),

          /// Note checkout button
          SizedBox(
            height: defaultMargin.h,
          ),
          Divider(
            thickness: 1,
            color: subtitleTextColor,
          ),
          Container(
            height: 50.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: defaultMargin.h,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/checkout-success', (route) => false);
              },
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 13.h,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              child: Text(
                'Checkout Now',
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}

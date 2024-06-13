import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/providers/cart_provider.dart';
import 'package:shamo_app/widgets/cart_card.dart';

import '../theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
          'Your Cart',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18.sp,
          ),
        ),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Container(
        color: bgColor3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_cart_empty.png',
              width: 80.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 44.h,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 10.h,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.carts.isEmpty) {
            return emptyCart();
          } else {
            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin.w,
              ),
              children: cartProvider.carts
                  .map(
                    (cart) => CartCard(
                      cart: cart,
                    ),
                  )
                  .toList(),
            );
          }
        },
      );
    }

    Widget customBottomNav() {
      return Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.carts.isEmpty) {
            return const SizedBox();
          } else {
            return SizedBox(
              height: 180.h,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: defaultMargin.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          '\$${cartProvider.totalPrice()}',
                          style: priceTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: subtitleTextColor,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 13.h,
                        ),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Continue to Checkout',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semibold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: primaryTextColor,
                            size: 24.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }


        },

      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}

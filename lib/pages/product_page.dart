import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/pages/detail_chat_page.dart';
import 'package:shamo_app/providers/cart_provider.dart';
import 'package:shamo_app/providers/wishlist_provider.dart';
import 'package:shamo_app/theme.dart';

import '../models/product_model.dart';
import '../utils/url_util.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccesDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: bgColor3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                        size: 24.w,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100.w,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 154.w,
                    height: 44.h,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16.w : 4.w,
        height: 4.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54.w,
        height: 54.h,
        margin: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20.h,
              left: defaultMargin.w,
              right: defaultMargin.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 24.w,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: bgColor1,
                  size: 24.w,
                )
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries
                .map(
                  (image) => CachedNetworkImage(
                    imageUrl: updateLocalhostUrl(image.url),
                    width: 310.w,
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
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries.map(
              (e) {
                index++;
                return indicator(index);
              },
            ).toList(),
          ),
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        height: 502.h,
        margin: EdgeInsets.only(top: 17.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.h),
          ),
          color: bgColor1,
        ),
        child: Column(
          children: [
            /// Note Header Content
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin.h,
                left: defaultMargin.w,
                right: defaultMargin.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.product.name}',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          '${widget.product.category}',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);

                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to the Wishlist',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle.copyWith(fontSize: 14.sp),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Has been removed from the Wishlist',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle.copyWith(fontSize: 14.sp),
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.product)
                          ? 'assets/button_wishlist_blue.png'
                          : 'assets/button_wishlist.png',
                      width: 46.w,
                    ),
                  ),
                ],
              ),
            ),

            /// Note Container Price Product
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.only(
                top: 20.h,
                left: defaultMargin.w,
                right: defaultMargin.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bgColor2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
            ),

            /// Note Container Description Product
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20.h,
                left: defaultMargin.w,
                right: defaultMargin.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    '${widget.product.description}',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            /// Note Familiar Shoes Product
            Container(
              margin: EdgeInsets.only(top: 30.h),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map(
                        (image) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin.w : 0.w),
                            child: familiarShoesCard(image),
                          );
                        },
                      ).toList(),
                    ),
                  )
                ],
              ),
            ),

            /// Note Buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin.w),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 54.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/button_chat.png'),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailChatPage(product: widget.product),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Container(
                      height: 54.h,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showSuccesDialog();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}

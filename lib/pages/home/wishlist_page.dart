import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/providers/wishlist_provider.dart';
import 'package:shamo_app/widgets/wishlist_card.dart';

import '../../providers/page_provider.dart';
import '../../theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);


    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18.sp,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishList() {
      return Expanded(
        child: Container(
          color: bgColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image_wishlist.png',
                width: 80.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                ' You don\'t have dream shoes?',
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
              Container(
                height: 44.h,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
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
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: bgColor3,
          child: Consumer<WishlistProvider>(
            builder: (context, wishlistProvider, child) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                children: wishlistProvider.wishlist
                    .map(
                      (product) => WishlistCard(
                        product: product,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyWishList(),
        Consumer<WishlistProvider>(
          builder: (context, wishlistProvider, child) {
            return wishlistProvider.wishlist.isEmpty
                ? emptyWishList()
                : content();
          },
        ),
      ],
    );
  }
}

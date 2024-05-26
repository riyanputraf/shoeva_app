import 'package:flutter/material.dart';
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
          child: Icon(Icons.chevron_left),
        ),
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
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
              top: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                CheckoutCard(),
                CheckoutCard(),
              ],
            ),
          ),

          /// Note address detail
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_store_location.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: defaultMargin,
                        ),
                        Image.asset(
                          'assets/icon_your_address.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: secondaryTextStyle.copyWith(
                              fontWeight: light,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Adidas Core Location',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: defaultMargin,),
                          Text(
                            'Your Address',
                            style: secondaryTextStyle.copyWith(
                              fontWeight: light,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Marsemoon',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
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

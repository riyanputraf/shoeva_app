import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
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
                child: Image.asset(
                  'assets/image_shoes.png',
                  width: 60,
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
                      'Terrex Urban Low',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '\$143,98',
                      style: priceTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/button_add.png',
                    width: 16,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '2',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/button_min.png',
                    width: 16,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon_remove.png',
                width: 10,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

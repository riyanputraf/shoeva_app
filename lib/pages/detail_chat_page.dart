import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({super.key});

  /// Refactor Later
  Widget header() {
    return PreferredSize(
      child: AppBar(
        backgroundColor: bgColor1,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/image_shop_online.png',
              width: 50,
            )
          ],
        ),
      ),
      preferredSize: Size.fromHeight(70),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/image_shop_online.png',
                width: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70),
      ),
    );
  }
}

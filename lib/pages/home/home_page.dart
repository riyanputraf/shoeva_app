import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, Riyan',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  '@riyanputraf',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/image_profile.png',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/theme.dart';

import '../models/message_model.dart';
import '../pages/detail_chat_page.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailChatPage(product: UnintializedProductModel(),),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 33.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image_shop_logo.png',
                  width: 54.w,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                       message.message,
                        style: secondaryTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 14.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
            SizedBox(height: 12.h,),
            const Divider(
              thickness: 2,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}

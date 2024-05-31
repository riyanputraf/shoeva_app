import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamo_app/pages/home/chat_page.dart';
import 'package:shamo_app/pages/home/home_page.dart';
import 'package:shamo_app/pages/home/profile_page.dart';
import 'package:shamo_app/pages/home/wishlist_page.dart';
import 'package:shamo_app/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget cartButton() {
    return FloatingActionButton(
      backgroundColor: secondaryColor,
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20.w,
      ),
    );
  }

  Widget customButtonNav() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.w),
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12.w,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: bgColor4,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 30.h,
                  bottom: 30.h,
                ),
                child: Image.asset(
                  'assets/icon_home.png',
                  width: 21.w,
                  color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 30.h,
                  bottom: 30.h,
                ),
                child: Image.asset(
                  'assets/icon_chat.png',
                  width: 20.w,
                  color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 30.h,
                  bottom: 30.h,
                ),
                child: Image.asset(
                  'assets/icon_wishlist.png',
                  width: 20.w,
                  color: currentIndex == 2 ? primaryColor : Color(0xff808191),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 30.h,
                  bottom: 30.h,
                ),
                child: Image.asset(
                  'assets/icon_profile.png',
                  width: 18.w,
                  color: currentIndex == 3 ? primaryColor : Color(0xff808191),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return ChatPage();
      case 2:
        return WishlistPage();
      case 3:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}

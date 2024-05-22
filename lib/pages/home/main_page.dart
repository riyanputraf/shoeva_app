import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget cartButton() {
    return FloatingActionButton(
      backgroundColor: secondaryColor,
      onPressed: () {},
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }

  Widget customButtonNav() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: bgColor4,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_home.png',
                width: 21,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_chat.png',
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_wishlist.png',
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_profile.png',
                width: 18,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: Text(
        'main page',
      ),
    );
  }
}

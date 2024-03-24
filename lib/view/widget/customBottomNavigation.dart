import 'package:aviz_application/core/const/appColor.dart';
import 'package:aviz_application/view/screen/category-screen.dart';
import 'package:aviz_application/view/screen/home-screen.dart';
import 'package:aviz_application/view/screen/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationScreen extends StatefulWidget {
  const CustomBottomNavigationScreen({Key? key});

  @override
  State<CustomBottomNavigationScreen> createState() =>
      _CustomBottomNavigationScreenState();
}

class _CustomBottomNavigationScreenState
    extends State<CustomBottomNavigationScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: IndexedStack(
        index: index,
        children: <Widget>[
          const HomeScreen(),
          const SplashScreen(),
          CategoryScreen(),
        ],
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Image.asset('images/bottomnav-icon.png',
                  height: 32, width: 32),
              icon: Image.asset('images/bottomnav-icon1.png',
                  height: 35, width: 35),
              label: 'آویز آگهی ها',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.search),
              label: 'جستجو',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(Icons.add_circle_outline_rounded, size: 35),
              label: 'افزودن آویز',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.circleUser),
              label: 'آویز من',
            ),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.primary,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          elevation: 0,
          iconSize: 30,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
      ),
    );
  }
}

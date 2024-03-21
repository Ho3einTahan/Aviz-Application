import 'package:aviz_application/core/const/appColor.dart';
import 'package:aviz_application/view/screen/home-screen.dart';
import 'package:aviz_application/view/screen/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationScreen extends StatefulWidget {
  const CustomBottomNavigationScreen({super.key});

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
        children: [
          HomeScreen(),
          SplashScreen(),
        ],
        index: index,
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(

          items: [
            BottomNavigationBarItem(
                icon: Image.asset('images/aviz-icon.png'),
                label: 'آویز آگهی ها'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.search), label: 'جستجو'),
            BottomNavigationBarItem(
                icon: FaIcon(Icons.add_circle_outline_rounded, size: 35),
                label: 'افزودن آویز'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.circleUser), label: 'آویز من'),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.primary,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          type: BottomNavigationBarType.shifting,
          currentIndex: index,
          elevation: 0,
          iconSize: 30,
          onTap: (value) {
            index = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}

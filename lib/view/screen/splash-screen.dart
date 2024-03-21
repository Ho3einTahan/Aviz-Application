import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/loginButton.dart';
import '../widget/signupButton.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
           const SizedBox(height: 100),
            Stack(
              children: [
                Image.asset('images/background-splash.png'),
                Center(
                  child: Image.asset('images/splash-image.png'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('اینجا محل'),
                Image.asset('images/aviz-icon.png'),
                const Text('آگهی شماست'),
              ],
            ),
           const SizedBox(height: 18),
            const Text(
                'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
                textAlign: TextAlign.center),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignupButtonWidget(),
                LoginButtonWidget(),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

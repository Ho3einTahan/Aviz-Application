import 'package:aviz_application/core/const/appColor.dart';
import 'package:aviz_application/view/screen/splash-screen.dart';
import 'package:flutter/material.dart';

import '../widget/customButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('ورود به',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Image.asset('images/aviz-icon.png'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی!'),
                const SizedBox(height: 32),
                PhoneNumberFieldWidget(),
                const Spacer(),
                CustomButton(
                  text: 'مرحله بعد   >',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen())),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'تاحالا ثبت نام نکردی ؟',
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'ثبت نام',
                          style:
                              TextStyle(color: AppColor.primary, fontSize: 19),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget PhoneNumberFieldWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'شماره موبایل',
          fillColor: AppColor.grayFieldColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grayFieldColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grayFieldColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grayFieldColor)),
        ),
      ),
    );
  }
}

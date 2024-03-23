import 'package:aviz_application/core/const/appColor.dart';
import 'package:flutter/material.dart';

import '../widget/hot-promotion-widget.dart';
import '../widget/main-promotion-widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/aviz-icon.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text('آویز های داغ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700))),
                    TextButton(
                        onPressed: () {},
                        child: Text('مشاهده همه',
                            style: TextStyle(
                                color: AppColor.greyText, fontSize: 14))),
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => HotPromotionWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text('آویز های اخیر',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700))),
                    TextButton(
                        onPressed: () {},
                        child: Text('مشاهده همه',
                            style: TextStyle(
                                color: AppColor.greyText, fontSize: 14))),
                  ],
                ),
              ),
              MainPromotionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

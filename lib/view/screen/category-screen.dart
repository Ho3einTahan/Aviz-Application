import 'package:aviz_application/core/const/appColor.dart';
import 'package:aviz_application/core/function/check-category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/category-item.dart';
import '../widget/customBottomNavigation.dart';
import '../widget/step-progress-indicator.dart';
import 'category-detail-screen.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  List<String> categoryNameList = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>
                                const CustomBottomNavigationScreen(),
                          ),
                          (route) => false),
                      icon: const Icon(CupertinoIcons.left_chevron, size: 30),
                    ),
                    Text(
                      'دسته بندی آویز',
                      style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(FontAwesomeIcons.xmark, size: 30),
                    ),
                  ],
                ),
              ),
              StepProgressIndicatorWidget(currentStep: 1),
              const SizedBox(height: 5),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: categoryNameList.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        int categoryNum =
                            CheckCategory(categoryNameList[index]);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetailScreen(categoryNum: categoryNum),
                        ));
                      },
                      child: CategoryItemWidget(categoryNameList[index])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
              StepProgressIndicatorWidget(currentStep: 1, context: context),
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

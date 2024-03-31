import 'package:aviz_application/core/const/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/function/check-category-detail.dart';
import '../widget/category-item.dart';
import '../widget/step-progress-indicator.dart';

class CategoryDetailScreen extends StatelessWidget {
  CategoryDetailScreen({super.key, required this.categoryNum});

  int categoryNum;

  @override
  Widget build(BuildContext context) {
    List<String> categoryDetailNameList =
        CheckCategoryDetail(categoryNum: categoryNum);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              StepProgressIndicatorWidget(currentStep: 2,context: context),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: categoryDetailNameList.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: CategoryItemWidget(categoryDetailNameList[index])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

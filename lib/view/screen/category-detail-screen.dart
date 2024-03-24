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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
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
              StepProgressIndicatorWidget(currentStep: 2),
              const SizedBox(height: 5),
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

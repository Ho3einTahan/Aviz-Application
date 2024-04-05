import 'package:aviz/core/const/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

Widget StepProgressIndicatorWidget(
    {required int currentStep, required BuildContext context}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
      child: Column(
        children: [
          Row(
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
          StepProgressIndicator(
            totalSteps: 5,
            currentStep: currentStep,
            size: 7,
            selectedColor: AppColor.primary,
            unselectedColor: Colors.transparent,
          ),
          const SizedBox(height: 5),
        ],
      ),
    ),
  );
}

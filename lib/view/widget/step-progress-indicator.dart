import 'package:aviz_application/core/const/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

Widget StepProgressIndicatorWidget({required int currentStep}) {
  return StepProgressIndicator(
    totalSteps: 5,
    currentStep: currentStep,
    size: 7,
    selectedColor: AppColor.primary,
    unselectedColor: Colors.transparent,
  );
}

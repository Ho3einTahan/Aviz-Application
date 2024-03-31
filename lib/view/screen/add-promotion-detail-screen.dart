import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:aviz_application/core/const/appColor.dart';
import 'package:aviz_application/core/const/home-feature-enum.dart';
import 'package:aviz_application/view/widget/step-progress-indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:input_quantity/input_quantity.dart';

import '../widget/customButton.dart';

class AddPromotionDetailScreen extends StatefulWidget {
  const AddPromotionDetailScreen({super.key});

  @override
  State<AddPromotionDetailScreen> createState() =>
      _AddPromotionDetailScreenState();
}

class _AddPromotionDetailScreenState extends State<AddPromotionDetailScreen> {
  bool isCheckElevator = false;
  bool isCheckParking = false;
  bool isCheckGarage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace:
              StepProgressIndicatorWidget(currentStep: 3, context: context)),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    const SizedBox(width: 18),
                    Icon(Icons.category_outlined,
                        color: AppColor.primary, size: 32),
                    const SizedBox(width: 10),
                    const Text('انتخاب دسته بندی آویز',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16)),
                  ],
                ),
                const Padding(
                  padding: const EdgeInsets.only(
                      right: 16, left: 110, top: 32, bottom: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('دسته بندی'),
                      const Text('محدوده ملک'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 159,
                        child: CustomDropdown<String>(
                          decoration: CustomDropdownDecoration(
                              closedBorder:
                                  Border.all(color: AppColor.greyText),
                              closedFillColor:
                                  AppColor.greyFieldColor.withOpacity(0.3)),
                          hintText: 'Select job role',
                          items: ['ali', 'hosein', 'mohammad', 'reza'],
                          initialItem: 'ali',
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        width: 159,
                        height: 50,
                        color: AppColor.greyFieldColor,
                        child: const Center(child: Text('خیابان صیاد شیرازی')),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Image.asset('images/clipboard.png'),
                    const SizedBox(width: 8),
                    const Text('ویژگی ها',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      right: 16, left: 110, top: 32, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('متراژ'),
                      Text('تعداد اتاق'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _QutyInputWidget(homeFeature: HomeFeatureEnum.metraj),
                    _QutyInputWidget(homeFeature: HomeFeatureEnum.countRoom),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      right: 16, left: 110, top: 32, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('طبقه'),
                      Text('سال ساخت'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _QutyInputWidget(homeFeature: HomeFeatureEnum.floor),
                    _QutyInputWidget(homeFeature: HomeFeatureEnum.yearOfBuild),
                  ],
                ),
                _FeatureWidget(),
                const SizedBox(height: 11),
                CustomButton(text: 'بعدی', onTap: () {}),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _QutyInputWidget({required HomeFeatureEnum homeFeature}) {
    return SizedBox(
      width: 150,
      height: 55,
      child: InputQty(
        qtyFormProps: QtyFormProps(enableTyping: false),
        decoration: QtyDecorationProps(
            qtyStyle: QtyStyle.btnOnRight,
            minusBtn: Icon(Icons.arrow_drop_down, color: AppColor.primary),
            plusBtn: Icon(Icons.arrow_drop_up, color: AppColor.primary),
            fillColor: AppColor.greyFieldColor,
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none)),
        steps: 1,
        onQtyChanged: (val) {},
      ),
    );
  }

  Widget _FeatureWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Row(
            children: [
              const SizedBox(width: 16),
              FaIcon(FontAwesomeIcons.wandMagicSparkles,
                  color: AppColor.primary),
              const SizedBox(width: 8),
              const Text('امکانات',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        _FeatureItem(title: 'آسانسور', homeFeature: HomeFeatureEnum.elevator),
        _FeatureItem(title: 'پارکینگ', homeFeature: HomeFeatureEnum.parking),
        _FeatureItem(title: 'انباری', homeFeature: HomeFeatureEnum.garage),
      ],
    );
  }

  Widget _FeatureItem(
      {required String title, required HomeFeatureEnum homeFeature}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (homeFeature == HomeFeatureEnum.garage) {
            isCheckGarage = !isCheckGarage;
          } else if (homeFeature == HomeFeatureEnum.parking) {
            isCheckParking = !isCheckParking;
          } else {
            isCheckElevator = !isCheckElevator;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.only(right: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: const Color(0xffF2F4F7)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Switch(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                activeColor: Colors.white,
                activeTrackColor: AppColor.primary,
                inactiveTrackColor: AppColor.greyText,
                inactiveThumbColor: Colors.white,
                value: homeFeature == HomeFeatureEnum.garage
                    ? isCheckGarage
                    : homeFeature == HomeFeatureEnum.parking
                        ? isCheckParking
                        : isCheckElevator,
                onChanged: (value) {
                  setState(() {
                    if (homeFeature == HomeFeatureEnum.garage) {
                      isCheckGarage = value;
                    } else if (homeFeature == HomeFeatureEnum.parking) {
                      isCheckParking = value;
                    } else {
                      isCheckElevator = value;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

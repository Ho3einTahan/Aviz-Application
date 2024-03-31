import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:aviz_application/core/const/appColor.dart';
import 'package:aviz_application/core/const/home-feature-enum.dart';
import 'package:aviz_application/view/widget/step-progress-indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:input_quantity/input_quantity.dart';

class AddPromotionDetailScreen extends StatefulWidget {
  const AddPromotionDetailScreen({super.key});

  @override
  State<AddPromotionDetailScreen> createState() =>
      _AddPromotionDetailScreenState();
}

class _AddPromotionDetailScreenState extends State<AddPromotionDetailScreen> {
  bool isCheck = false;
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
                    SizedBox(width: 16),
                    Image.asset('images/clipboard.png'),
                    SizedBox(width: 8),
                    Text('ویژگی ها',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                const Padding(
                  padding: const EdgeInsets.only(
                      right: 16, left: 110, top: 32, bottom: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('متراژ'),
                      const Text('تعداد اتاق'),
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
                  padding: const EdgeInsets.only(
                      right: 16, left: 110, top: 32, bottom: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('طبقه'),
                      const Text('سال ساخت'),
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
        maxVal: 100,
        initVal: 0,
        minVal: -100,
        steps: 1,
        onQtyChanged: (val) {
          print(val);
        },
      ),
    );
  }

  Widget _FeatureWidget() {
    return Column(
      children: [
        Row(
          children: [
            FaIcon(FontAwesomeIcons.wandMagicSparkles, color: AppColor.primary),
            SizedBox(width: 8),
            Text('امکانات',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ],
        ),
        _FeatureItem(title: 'آسانسور'),
      ],
    );
  }

  Widget _FeatureItem({required String title}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.greyFieldColor),
      ),
      child: Row(
        children: [
          Text(title),
          Switch(
            activeColor: AppColor.primary,
            activeTrackColor: Colors.white,
            focusColor: Colors.black,
            inactiveTrackColor: Colors.green,
            inactiveThumbColor: Colors.yellow,
            value: isCheck,
            onChanged: (value) {
              isCheck = !isCheck;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

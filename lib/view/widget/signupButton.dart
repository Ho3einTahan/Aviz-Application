import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/const/appColor.dart';

Widget SignupButtonWidget() {
  return SizedBox(
    width: 159,
    height: 50,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColor.primary,
        ),
        onPressed: () {},
        child: const Text(
          'ثبت نام',
          style: TextStyle(fontSize: 20),
        )),
  );
}

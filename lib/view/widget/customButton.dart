import 'package:aviz_application/core/const/appColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomButton({required String text, required Function onTap}) {
  return Container(
    height: 50,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColor.primary,
        ),
        onPressed: () => onTap(),
        child: Text(
          text,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        )),
  );
}

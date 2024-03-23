import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MainPromotionWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    margin: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.white.withOpacity(0.2)),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('واحد دوبلکس فول امکانات',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              const SizedBox(height: 8),
              Text(
                  'سال ساخت ۱rtryrytytutyiyiuyo۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('قیمت:'),
                  Spacer(),
                  Container(
                    color: const Color(0xffF9FAFB),
                    child: Text('۲۵٬۶۸۳٬۰۰۰٬۰۰۰',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        Image.asset('images/home3.png'),
      ],
    ),
  );
}

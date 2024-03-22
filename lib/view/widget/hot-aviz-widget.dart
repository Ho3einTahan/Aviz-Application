import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget HotAvizWidget() {
  return Container(
    width: 224,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 26),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(4)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('images/home1.png')),
        Text('ویلا ۵۰۰ متری زیر قیمت',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
        Text('ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
            style: TextStyle(fontSize: 12, color: Colors.grey)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('قیمت:'),
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
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget HotPromotionWidget() {
  return Container(
    width: 224,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
    ], color: Colors.white, borderRadius: BorderRadius.circular(4)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('images/home1.png')),
        Text('ویلا ۵۰۰ متری زیر قیمت',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis)),
        Text('ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
            style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis)),
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

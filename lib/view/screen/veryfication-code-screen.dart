import 'dart:async';

import 'package:aviz_application/view/widget/customButton.dart';
import 'package:flutter/material.dart';

class VeryficationCodeScreen extends StatefulWidget {
  VeryficationCodeScreen({super.key});

  @override
  State<VeryficationCodeScreen> createState() => _VeryficationCodeScreenState();
}

class _VeryficationCodeScreenState extends State<VeryficationCodeScreen> {
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  final List<TextEditingController> _controllers =
      List.generate(5, (index) => TextEditingController());
  int secound = 60;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (secound > 0) {
        secound -= 1;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('تایید شماره موبایل',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('کد ورود پیامک شده را وارد کنید',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 32),
                _otpTextField(),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        secound.toString() == '0'
                            ? '00:' + secound.toString() + '0'
                            : '00:' + secound.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            secound = 60;
                          });
                        },
                        child: Text(
                          'ارسال مجدد کد',
                          style: TextStyle(
                              color: secound == 0 ? Colors.black : Colors.grey,
                              fontSize: 17),
                        )),
                  ],
                ),
                const Spacer(),
                CustomButton(text: 'تایید ورود', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        5,
        (index) => SizedBox(
          width: 65,
          height: 55,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            onChanged: (String value) {
              if (value.isNotEmpty && index < 4) {
                _focusNodes[index + 1].requestFocus();
              }
            },
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counter: const SizedBox.shrink(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

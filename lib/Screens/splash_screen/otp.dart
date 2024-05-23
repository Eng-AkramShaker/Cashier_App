// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../home_screen/home_screen.dart';

class OTP_Screen extends StatelessWidget {
  OtpFieldController otpController = OtpFieldController();

  OTP_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.imgur.com/YRsyiVK.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  SizedBox(
                    height: 150,
                    width: 440,
                    child: Image.network(
                      "https://i.imgur.com/z7FBnXt.png",
                      fit: BoxFit.fitWidth,
                      scale: 20,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    height: 100,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFBC02D)),
                    ),
                    child: OTPTextField(
                      controller: otpController,
                      length: 5,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      style: const TextStyle(fontSize: 17, color: Color(0xFFFBC02D)),
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: const Color.fromARGB(78, 255, 255, 255),
                        focusBorderColor: Colors.white,
                        disabledBorderColor: const Color(0xFFFBC02D),
                        enabledBorderColor: const Color(0xFFFBC02D),
                        errorBorderColor: const Color.fromARGB(255, 54, 244, 235),
                      ),
                      onChanged: (pin) {
                        if (pin == "12345") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home_Screen()));
                          otpController.clear();
                        }
                      },
                      onCompleted: (pin) {
                        // يمكن إضافة أي إجراء عند اكتمال الإدخال
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable, unused_local_variable, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:cashier/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/auth/Login.dart';
import '../../core/constants/navigators.dart';
import '../../core/services/api.dart';
import '../../widgets/Buttons/custom_button.dart';
import '../../widgets/show_snack/Snack_Bar.dart';
import '../../widgets/show_snack/select_menu.dart';
import '../../widgets/texts/custom_text.dart';
import '../home_screen/screens/home_screen.dart';

class Login_OTP_Screen extends StatefulWidget {
  const Login_OTP_Screen({super.key});

  @override
  State<Login_OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<Login_OTP_Screen> {
  OtpFieldController otpController = OtpFieldController();

  bool is_lodging = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<Login_Provider>(builder: (context, pro_Login, child) {
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
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 12.h,
                      // width: 12.w,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 15.h),

                    // ==========================================================
                    SizedBox(
                      width: size.width / 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Custom_Button(
                            context: context,
                            title: 'Face ID',
                            size_text: 13.sp,
                            vertical: 1.8.h,
                            horizontal: 3.w,
                            backgroundColor: const Color.fromARGB(255, 173, 125, 57),
                            Color_text: Colors.white,
                            Border_Color: Colors.green,
                            onPressed: () {
                              //
                            },
                          ),

                          // Login =========================================================

                          Custom_Button(
                            context: context,
                            // title: 'SR ${pro_Invoice.pay}',
                            title: ' Login ',
                            size_text: 13.sp,
                            vertical: 1.8.h,
                            horizontal: 3.w,
                            backgroundColor: const Color.fromARGB(255, 173, 125, 57),
                            Color_text: Colors.white,
                            Border_Color: Colors.green,
                            onPressed: () {
                              //

                              Snack_Select_Menu(
                                context: context,
                                delete_onPressed: () {
                                  setState(() {});
                                  pop(context);
                                },
                                widget: SizedBox(
                                  height: 36.h,
                                  child: Column(
                                    children: [
                                      //
                                      SizedBox(height: 4.h),
                                      Custom_Text(text: "Login", size: 15.sp, fontweight: FontWeight.bold, color: Colors.black),

                                      SizedBox(height: 5.h),

                                      TextField_Login(
                                        hintText: 'admin@gmail.com',
                                        size: size,
                                        icon: Icons.email,
                                        title: 'Email',
                                        onChanged: (value) {
                                          //

                                          setState(() {
                                            pro_Login.email.text = value;
                                          });
                                        },
                                      ),

                                      SizedBox(height: 2.h),

                                      TextField_Login(
                                        hintText: '123456789',
                                        size: size,
                                        icon: Icons.password,
                                        title: 'Password',
                                        onChanged: (value) {
                                          //

                                          setState(() {
                                            pro_Login.pass.text = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () async {
                                  await Snak_Bar(context, " جاري تسجيل الدخول ");

                                  Api().Api_Login(context, pro_Login.email.text, pro_Login.pass.text).then((value) {
                                    if (value == 'Logged In') {
                                      removeAllNavigation(context, const HomeScreen());
                                    }
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // OTP ======================================================

                    // Container(
                    //   height: 10.h,
                    //   width: 32.w,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(12),
                    //     border: Border.all(color: const Color(0xFFFBC02D)),
                    //   ),
                    //   child: OTPTextField(
                    //     controller: otpController,
                    //     length: 5,
                    //     width: MediaQuery.of(context).size.width,
                    //     textFieldAlignment: MainAxisAlignment.spaceAround,
                    //     fieldWidth: 45,
                    //     fieldStyle: FieldStyle.box,
                    //     outlineBorderRadius: 15,
                    //     style: const TextStyle(fontSize: 17, color: Color.fromARGB(255, 255, 255, 255)),
                    //     otpFieldStyle: OtpFieldStyle(
                    //       backgroundColor: const Color.fromARGB(78, 255, 255, 255),
                    //       focusBorderColor: Colors.white,
                    //       disabledBorderColor: const Color(0xFFFBC02D),
                    //       enabledBorderColor: const Color(0xFFFBC02D),
                    //       errorBorderColor: const Color.fromARGB(255, 54, 244, 235),
                    //     ),
                    //     onChanged: (pin) {
                    //       if (pin == "12345") {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    //         otpController.clear();
                    //       }
                    //     },
                    //     onCompleted: (pin) {
                    //       // يمكن إضافة أي إجراء عند اكتمال الإدخال
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class TextField_Login extends StatelessWidget {
  const TextField_Login(
      {super.key, required this.size, required this.icon, required this.onChanged, required this.title, required this.hintText});

  final Size size;

  final icon;
  final onChanged;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100, child: Custom_Text(text: "$title :  ", size: 11.sp, fontweight: FontWeight.bold, color: Colors.black)),
        SizedBox(
          height: 60,
          width: size.width / 4.5,
          child: TextField(
            style: (const TextStyle(color: bgColor, fontWeight: FontWeight.bold)),
            keyboardType: TextInputType.emailAddress,
            cursorColor: bgColor,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: bgColor),
              ),
              fillColor: const Color.fromARGB(113, 216, 170, 70),
              hintText: hintText,
              hintStyle: const TextStyle(color: Color.fromARGB(255, 131, 125, 125)),
              filled: true,
              prefixIcon: Icon(icon),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bgColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

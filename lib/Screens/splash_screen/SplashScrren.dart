import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'otp.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 170,
      logo: Image.network(
        'https://i.imgur.com/kNksgmP.gif',
      ),
      title: Text(
        "اهلا وسهلا في اجمل مطعم في العالم",
        style: GoogleFonts.playfairDisplay(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.amber[200]
            //Color(0xFFFBC02D)
            ),
      ),
      backgroundColor: Colors.black,
      showLoader: true,
      loaderColor: const Color(0xFFFBC02D),
      loadingText: const Text(
        "Loading...",
        style: TextStyle(color: Color(0xFFFBC02D)),
      ),
      navigator: OTP_Screen(),
      durationInSeconds: 5,
    );
  }
}

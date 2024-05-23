import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'otp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 170,
      logo: Image.network(
        'https://i.imgur.com/kNksgmP.gif',
      ),
      title: Text(
        "\" Food is not just about sustenance,\n it's a gateway to culture, a celebration of flavors, and a symphony of experiences,\n all served on the plate of a well-crafted restaurant.\"",
        style: GoogleFonts.playfairDisplay(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.amber[200]
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

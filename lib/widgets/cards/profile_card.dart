import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 20;

    return Row(
      children: [
        Container(
          height: 5.5.h,
          margin: EdgeInsets.only(left: size),
          padding: EdgeInsets.symmetric(
            horizontal: size,
            vertical: size / 3,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(31, 218, 204, 75),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: const Color.fromARGB(136, 255, 255, 255)),
          ),
          child: Row(
            children: [
              Image.asset("assets/images/admin.png", height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size / 2),
                child: Text(
                  "Manager",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
              // Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),

        // --------------------------------------------------------------------------

        Container(
          height: 5.5.h,
          margin: EdgeInsets.only(left: size),
          padding: EdgeInsets.symmetric(
            horizontal: size,
            vertical: size / 3,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(31, 218, 204, 75),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: const Color.fromARGB(136, 255, 255, 255)),
          ),
          child: Row(
            children: [
              Image.asset("assets/images/admin.png", height: 4.h),
              // if (!Responsive.isMobile(context))
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size / 2),
                child: Text(
                  "Admin",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
              // Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }
}

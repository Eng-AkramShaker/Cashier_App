import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 20;

    return Container(
      margin: EdgeInsets.only(left: size),
      padding: EdgeInsets.symmetric(
        horizontal: size,
        vertical: size / 3,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 218, 204, 75),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/admin.png", height: 38),
          // if (!Responsive.isMobile(context))
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size / 2),
            child: const Text(
              "Admin",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          // Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }
}

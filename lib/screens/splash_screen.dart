import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nkap_agent/screens/auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/splash.png",
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  children: [
                    Text(
                      "Track, Manage and Optimize Collection",
                      style: TextStyle(
                          fontSize: 26.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Boost, provide a secure and new way that facilitate the daily collection activities in microfinances. ",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100.w, 6.h),
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onPressed: () {
                    Get.offAll(Authentication_screen());
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

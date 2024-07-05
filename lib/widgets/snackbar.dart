import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MySnackbar {
  static mySnackbar(whatev, myContent) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    if (kDebugMode) {
      Get.snackbar(
        '',
        '',
        titleText: Text("Message",
            style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        messageText: Text(myContent,
            style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 18.sp,
                height: 0.06.h,
                color: Colors.black,
                fontWeight: FontWeight.w300)),
        isDismissible: true,
        snackPosition: SnackPosition.TOP,
        dismissDirection: DismissDirection.horizontal,
        icon: Icon(Icons.info_rounded, color: Colors.black, size: 20.sp),
        shouldIconPulse: false,
        maxWidth: 80.w,
        borderRadius: 15.sp,
        duration: const Duration(seconds: 5),
        animationDuration: const Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
        padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 2.h),
        backgroundColor: Colors.deepPurple,
      );
    }
  }
}

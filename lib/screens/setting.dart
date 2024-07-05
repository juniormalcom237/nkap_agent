import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(20),
                      borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.8.h,
                      ),
                      InkWell(
                        onTap: () {
                          // Get.back();
                          // MyDialog.onLoading();
                          // c.uploadImage();
                        },
                        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 100.w,
                          height: 6.h,
                          padding: EdgeInsets.only(left: 4.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Ionicons.language_outline,
                                  size: 19.sp, color: Colors.black87),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, top: 0.5.h),
                                child: Text(
                                  "En Francais",
                                  style: TextStyle(
                                      height: 0.h,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lexend',
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(const ChangePin(),
                          //     transition: Transition.rightToLeft,
                          //     curve: Curves.easeOut);
                        },
                        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 100.w,
                          height: 6.h,
                          padding: EdgeInsets.only(left: 4.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.policy_sharp,
                                  size: 19.sp, color: Colors.black87),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, top: 0.5.h),
                                child: Text(
                                  "Policy",
                                  style: TextStyle(
                                      height: 0.h,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lexend',
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(20),
                      borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.8.h,
                      ),
                      InkWell(
                        onTap: () {
                          // Get.back();
                          // MyDialog.onLoading();
                          // c.uploadImage();
                        },
                        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 100.w,
                          height: 6.h,
                          padding: EdgeInsets.only(left: 4.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.book_sharp,
                                  size: 19.sp, color: Colors.black87),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, top: 0.5.h),
                                child: Text(
                                  "Termes and Condition",
                                  style: TextStyle(
                                      height: 0.h,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lexend',
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(const ChangePin(),
                          //     transition: Transition.rightToLeft,
                          //     curve: Curves.easeOut);
                        },
                        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 100.w,
                          height: 6.h,
                          padding: EdgeInsets.only(left: 4.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Ionicons.information_circle_outline,
                                  size: 19.sp, color: Colors.black87),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, top: 0.5.h),
                                child: Text(
                                  "About ",
                                  style: TextStyle(
                                      height: 0.h,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lexend',
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(20),
                      borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.to(const ChangePin(),
                          //     transition: Transition.rightToLeft,
                          //     curve: Curves.easeOut);
                        },
                        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 100.w,
                          height: 6.h,
                          padding: EdgeInsets.only(left: 4.w),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.sp))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Ionicons.exit_outline,
                                  size: 19.sp, color: Colors.black87),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, top: 0.5.h),
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      height: 0.h,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Lexend',
                                      color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

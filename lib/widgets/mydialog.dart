import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDialog {
  static deletePartnerDialog() {
    TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> _pinKey = GlobalKey<FormState>();
    Get.dialog(BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: CupertinoAlertDialog(
        // title: Text("deletePartner".trParams({'partner': name})),
        title: Text(
          "Verify Collector",
          style: TextStyle(fontFamily: 'Lexend', fontSize: 18.sp),
        ),
        content: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Show this qrCode to the contribution to scan and see if you are the one assign to him",
              style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: 100.w,
              height: 24.h,
              child: QrImageView(
                data: "Tassse JUnio",
                version: QrVersions.auto,
                size: 4000,
                gapless: false,
              ),
            )
          ],
        ),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Done",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              )),
        ],
      ),
    ));
  }
}

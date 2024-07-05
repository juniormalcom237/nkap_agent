import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.sp,
      width: 22.sp,
      child: const CircularProgressIndicator(
        strokeWidth: 2.0,
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
      ),
    );
  }
}

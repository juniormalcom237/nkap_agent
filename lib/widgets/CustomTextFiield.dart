import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.title,
      required this.label,
      this.leading,
      this.trailing,
      this.callBack,
      required this.validator,
      this.inputType,
      this.maxLength,
      required this.controller})
      : super(key: key);

  final String title;
  final String label;
  final Widget? leading;
  final Widget? trailing;

  final String? Function(String)? callBack;
  final int? maxLength;

  final TextInputType? inputType;
  final TextEditingController controller;
  final String? Function(String) validator;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title == "") ...[
          SizedBox(
            height: 1.h,
          )
        ] else ...[
          Text(title),
          SizedBox(
            height: 1.h,
          ),
        ],
        Container(
          // height: 7.h,
          child: TextFormField(
            maxLength: maxLength,
            controller: controller,
            keyboardType: inputType,
            // scrollPadding: EdgeInsets.all(8),
            validator: (value) {
              return validator(value!);
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              counter: const Offstage(),
              suffix: trailing,
              hintText: label,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFF3AB0FF),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff150E56),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xff061c4e))),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}

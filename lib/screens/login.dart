import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nkap_agent/widgets/process_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../api/api_controller.dart';
import '../validate.dart';
import '../widgets/CustomTextFiield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var rememberMe = false;
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final MyController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          CustomTextFormField(
            title: "Email",
            label: "Enter your email",
            maxLength: 30,
            inputType: TextInputType.number,
            controller: EmailController,
            validator: (val) {
              return Validator.validateEmail(val);
            },
            trailing: Icon(
              CupertinoIcons.check_mark_circled_solid,
            ),
          ),
          CustomTextFormField(
            title: "Password",
            label: "Min. 8 character",
            controller: PasswordController,
            validator: (val) {
              return Validator.validatePin(val);
            },
            trailing: Icon(CupertinoIcons.eye),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1,
                    child: Checkbox(
                      visualDensity: VisualDensity.compact,
                      value: rememberMe,
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    "Remember me",
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  // context.push('/forgot-password');
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Obx(() {
            return MaterialButton(
              onPressed: !c.isLoading.value
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        c.login(EmailController.text, PasswordController.text);
                      }
                    }
                  : null,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minWidth: 90.w,
              height: 5.7.h,
              color: Color(0xff6D67E4),
              // color: Color(0xff16003B),
              // color: Colors.green,
              child: c.isLoading.value
                  ? MyProgressIndicator()
                  : Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
            );
          }),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.grey,
                height: 0.02.h,
                width: 25.w,
              ),
              Text(
                "Or Login With",
                style: TextStyle(fontSize: 14.sp),
              ),
              Container(
                color: Colors.grey,
                width: 25.w,
                height: 0.02.h,
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          MaterialButton(
            splashColor: Colors.green,
            onPressed: () {},
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.green, width: 0.5)),
            minWidth: 90.w,
            // color: Colors.green,
            height: 5.7.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/google.png",
                  width: 18.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "Google",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

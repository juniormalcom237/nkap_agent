import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nkap_agent/validate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../api/api_controller.dart';
import '../widgets/CustomTextFiield.dart';
import '../widgets/process_indicator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  final MyController c = Get.find();

  final _formKey = GlobalKey<FormState>();
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
            title: "Name",
            label: "John Doe",
            maxLength: 14,
            validator: (val) {
              return Validator.validateName(val);
            },
            controller: NameController,
            trailing: Icon(
              CupertinoIcons.check_mark_circled_solid,
            ),
          ),
          CustomTextFormField(
            title: "Email",
            label: "Enter your email",
            maxLength: 30,
            inputType: TextInputType.number,
            controller: _phoneController,
            validator: (val) {
              return Validator.validateEmail(val);
            },
            trailing: Icon(
              CupertinoIcons.check_mark_circled_solid,
            ),
          ),
          CustomTextFormField(
            title: "Password",
            label: "Min. 8 characters",
            // inputType: TextInputType.number,
            validator: (val) {
              return Validator.validatePin(val);
            },
            controller: PasswordController,
            trailing: Icon(CupertinoIcons.eye),
          ),
          SizedBox(
            height: 2.h,
          ),
          Obx(() {
            return MaterialButton(
              onPressed: !c.isLoading.value
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        c.registration(NameController.text,
                            _phoneController.text, PasswordController.text);
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
                "Or Register With",
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
            height: 4.h,
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
                Text("Google")
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login.dart';
import 'registration.dart';

class Authentication_screen extends StatefulWidget {
  const Authentication_screen({Key? key}) : super(key: key);

  @override
  State<Authentication_screen> createState() => _Authentication_screenState();
}

class _Authentication_screenState extends State<Authentication_screen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    visualDensity: VisualDensity.compact,
                    minVerticalPadding: 10,
                    title: Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Basic",
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text("Welcome Back to InKap"),
                    ),
                    trailing: Container(
                      child: GestureDetector(
                        onTap: () {
                          // context.push('/languages');
                        },
                        child: CircleAvatar(
                          maxRadius: 18.sp,
                          backgroundImage: AssetImage(
                            "assets/images/logo_usa.jpg",

                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                AuthTabBar(
                  index: index,
                  callBack1: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  callback2: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
                index == 1 ? LoginScreen() : RegistrationScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthTabBar extends StatelessWidget {
  AuthTabBar(
      {Key? key,
      required this.callBack1,
      required this.callback2,
      required this.index})
      : super(key: key);
  Function callBack1;
  Function callback2;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xff6D67E4).withAlpha(100),
          )),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => callBack1(),
              child: AuthTabItem(
                title: "Login",
                isSelected: index == 1 ? true : false,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                callback2();
              },
              child: AuthTabItem(
                title: "Registration",
                isSelected: index == 2 ? true : false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthTabItem extends StatelessWidget {
  AuthTabItem({Key? key, required this.title, required this.isSelected})
      : super(key: key);
  final String title;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff6D67E4) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nkap_agent/api/api_controller.dart';
import 'package:nkap_agent/screens/add_transaction.dart';
import 'package:nkap_agent/screens/userItem.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/users.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  MyController c = Get.find();
  Future<List<Users>?>? users;

  @override
  void initState() {
    // TODO: implement initState
    users = c.getContributors();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // users = c.localDB.read("contributors") != null
    //     ? c.localDB.read("contributors") as List<Users>
    //     : [];
    // print(users);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Contributors",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 5.h,
                      width: 76.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.4))),
                      ),
                    ),
                    CircleAvatar(
                      child: Icon(Ionicons.filter),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                FutureBuilder<List<Users>?>(
                  future: users,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Container(
                            height: 80.h,
                            child: Center(
                                child: placeholderWhileTransactionBuild()));
                      case ConnectionState.done:
                      default:
                        if (snapshot.hasError) {
                          return Container(
                              height: 80.h,
                              child:
                                  Center(child: errorBusiness(snapshot.error)));
                        } else if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return Container(
                              height: 85.h,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          SizedBox(
                                            // width: 70.w,
                                            child: Text(
                                              "No Assign Collector".tr,
                                              style: TextStyle(
                                                  fontFamily: 'Lexend',
                                                  fontSize: 18.sp,
                                                  color: Colors.white54,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          // SizedBox(
                                          //   width: 80.w,
                                          //   child: Text(
                                          //     "historyDescriptionlabel".tr,
                                          //     softWrap: true,
                                          //     textAlign: TextAlign.center,
                                          //     style: TextStyle(
                                          //         fontFamily: 'Lexend',
                                          //         fontSize: 16.sp,
                                          //         color: Colors.white38,
                                          //         fontWeight: FontWeight.w200),
                                          //   ),
                                          // ),
                                          // SizedBox(
                                          //   height: 10.h,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    // MaterialButton(
                                    //     minWidth: 70.w,
                                    //     padding: EdgeInsets.symmetric(
                                    //         vertical: 2.h, horizontal: 20.w),
                                    //     color: Theme.of(context)
                                    //         .colorScheme
                                    //         .primary,
                                    //     splashColor: Colors.transparent,
                                    //     focusColor: Colors.transparent,
                                    //     hoverColor: Colors.transparent,
                                    //     shape: RoundedRectangleBorder(
                                    //         borderRadius:
                                    //             BorderRadius.horizontal(
                                    //                 left:
                                    //                     Radius.circular(15.sp),
                                    //                 right: Radius.circular(
                                    //                     15.sp))),
                                    //     onPressed: () {
                                    //       // setState(() {
                                    //       //   allTransaction = c.getTransaction(
                                    //       //       widget.businessId);
                                    //       // });
                                    //     },
                                    //     child: Text(
                                    //       "historyErrorReload".tr,
                                    //       style: TextStyle(
                                    //           fontFamily: 'Lexend',
                                    //           fontSize: 16.sp,
                                    //           color: Colors.white70,
                                    //           fontWeight: FontWeight.w500),
                                    //     )),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    c.localDB.write(
                                        "selectedUser", snapshot.data![index]);
                                    Get.to(AddTransactionScreen());
                                  },
                                  child: UserItem(
                                      id: snapshot.data![index].id,
                                      name: snapshot.data![index].name,
                                      telephone: "679475110"),
                                );
                              },
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                            );
                          }
                        } else {
                          return placeholderWhileTransactionBuild();
                        }
                    }
                  },
                ),
                //
                // if (users.length > 0)
                //   ...users
                //       .map((e) => UserItem(name: e.name, telephone: e.phone))
                // else
                //   Text("No users has been assigned")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget placeholderWhileTransactionBuild() => Center(
      child: SizedBox(
        height: 26.sp,
        width: 26.sp,
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
Padding errorBusiness(Object? error) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.portable_wifi_off_outlined,
          size: 56.sp,
        ),
        SizedBox(height: 2.h),
        Text("$error",
            style: TextStyle(
                fontFamily: 'Lexend',
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 2.h),
        // Obx(
        //   () => MaterialButton(
        //       minWidth: 60.w,
        //       padding: EdgeInsets.symmetric(vertical: 1.5.h),
        //       color: Theme.of(Get.context!).colorScheme.primary,
        //       splashColor: Colors.transparent,
        //       focusColor: Colors.transparent,
        //       hoverColor: Colors.transparent,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.horizontal(
        //               left: Radius.circular(15.sp),
        //               right: Radius.circular(15.sp))),
        //       onPressed: () {},
        //       // onPressed: !c.isLoading.value
        //       //     ? () {
        //       //   setState(() {
        //       //     allTransaction = c.getTransaction(widget.businessId);
        //       //   });
        //       // }
        //       //     : null,
        //       child: Text("showPartnersNoInternetButton".tr,
        //           style: TextStyle(
        //               fontFamily: 'Lexend',
        //               fontSize: 16.sp,
        //               fontWeight: FontWeight.w500))),
        // ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../api/api_controller.dart';
import '../widgets/fl_comp.dart';
import 'home.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  MyController c = Get.find();

  // Future<List<Transaction>?>? transaction;

  final transactions = [
    TransactionListTile(
      name: "sandra",
      type: "collect",
      amount: "20000",
      date: "2024-07-04",
    ),
    TransactionListTile(
      type: "collect",
      amount: "50000",
      name: "Sandra",
      date: "2024-07-04",
    ),
    TransactionListTile(
      type: "collect",
      amount: "60000",
      name: "Sandra",
      date: "2024-07-05",
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    // transaction = c.getTransaction(c.localDB.read("userData")['id']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Activity",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Icon(Ionicons.ellipsis_vertical)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10)),
                  child: BarChartSample2(),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                // FutureBuilder<List<Transaction>?>(
                //   future: transaction,
                //   builder: (context, snapshot) {
                //     switch (snapshot.connectionState) {
                //       case ConnectionState.waiting:
                //         return Container(
                //             height: 80.h,
                //             child: Center(
                //                 child: placeholderWhileTransactionBuild()));
                //       case ConnectionState.done:
                //       default:
                //         if (snapshot.hasError) {
                //           return Container(
                //               height: 80.h,
                //               child:
                //                   Center(child: errorBusiness(snapshot.error)));
                //         } else if (snapshot.hasData) {
                //           if (snapshot.data!.isEmpty) {
                //             return Container(
                //               height: 85.h,
                //               child: Center(
                //                 child: Column(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: [
                //                     Expanded(
                //                       child: Column(
                //                         children: [
                //                           SizedBox(
                //                             height: 25.h,
                //                           ),
                //                           SizedBox(
                //                             // width: 70.w,
                //                             child: Text(
                //                               "No Assign Collector".tr,
                //                               style: TextStyle(
                //                                   fontFamily: 'Lexend',
                //                                   fontSize: 18.sp,
                //                                   color: Colors.white54,
                //                                   fontWeight: FontWeight.w400),
                //                             ),
                //                           ),
                //                           SizedBox(
                //                             height: 1.h,
                //                           ),
                //                           // SizedBox(
                //                           //   width: 80.w,
                //                           //   child: Text(
                //                           //     "historyDescriptionlabel".tr,
                //                           //     softWrap: true,
                //                           //     textAlign: TextAlign.center,
                //                           //     style: TextStyle(
                //                           //         fontFamily: 'Lexend',
                //                           //         fontSize: 16.sp,
                //                           //         color: Colors.white38,
                //                           //         fontWeight: FontWeight.w200),
                //                           //   ),
                //                           // ),
                //                           // SizedBox(
                //                           //   height: 10.h,
                //                           // ),
                //                         ],
                //                       ),
                //                     ),
                //                     // MaterialButton(
                //                     //     minWidth: 70.w,
                //                     //     padding: EdgeInsets.symmetric(
                //                     //         vertical: 2.h, horizontal: 20.w),
                //                     //     color: Theme.of(context)
                //                     //         .colorScheme
                //                     //         .primary,
                //                     //     splashColor: Colors.transparent,
                //                     //     focusColor: Colors.transparent,
                //                     //     hoverColor: Colors.transparent,
                //                     //     shape: RoundedRectangleBorder(
                //                     //         borderRadius:
                //                     //             BorderRadius.horizontal(
                //                     //                 left:
                //                     //                     Radius.circular(15.sp),
                //                     //                 right: Radius.circular(
                //                     //                     15.sp))),
                //                     //     onPressed: () {
                //                     //       // setState(() {
                //                     //       //   allTransaction = c.getTransaction(
                //                     //       //       widget.businessId);
                //                     //       // });
                //                     //     },
                //                     //     child: Text(
                //                     //       "historyErrorReload".tr,
                //                     //       style: TextStyle(
                //                     //           fontFamily: 'Lexend',
                //                     //           fontSize: 16.sp,
                //                     //           color: Colors.white70,
                //                     //           fontWeight: FontWeight.w500),
                //                     //     )),
                //                   ],
                //                 ),
                //               ),
                //             );
                //           } else {
                //             return
                //             // return ListView.builder(
                //             //   itemBuilder: (ctx, index) {
                //             //     return TransactionListTile(
                //             //       name: snapshot.data![index].user!.name,
                //             //       type: snapshot.data![index].type,
                //             //       amount: snapshot.data![index].amount,
                //             //     );
                //             //   },
                //             //   shrinkWrap: true,
                //             //   itemCount: snapshot.data!.length,
                //             // );
                //           }
                //         } else {
                //           return placeholderWhileTransactionBuild();
                //         }
                //     }
                //   },
                // ),
                Column(
                  children: [
                    ...transactions
                        .map((e) => TransactionListTile(
                              name: e.name,
                              type: e.type,
                              amount: e.amount,
                              date: e.date,
                            ))
                        .toList()
                  ],
                )
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

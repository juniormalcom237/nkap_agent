import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nkap_agent/api/api_controller.dart';
import 'package:nkap_agent/screens/setting.dart';
import 'package:nkap_agent/screens/transaction.dart';
import 'package:nkap_agent/screens/users.dart';
import 'package:nkap_agent/widgets/mydialog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  var _screenList = [
    Home1(),
    TransactionScreen(),
    UserScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        height: 8.h,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Ionicons.home_outline),
            selectedIcon: Icon(Ionicons.home_sharp),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Ionicons.pulse),
            selectedIcon: Icon(Ionicons.pulse_sharp),
            label: 'Transaction',
          ),
          NavigationDestination(
            selectedIcon: Icon(Ionicons.walk_sharp),
            icon: Icon(Ionicons.walk_outline),
            label: 'User',
          ),
          NavigationDestination(
            selectedIcon: Icon(Ionicons.settings_sharp),
            icon: Icon(Ionicons.settings_outline),
            label: 'User',
          ),
        ],
      ),
      body: _screenList[currentPageIndex],
    );
  }
}

class Home1 extends StatefulWidget {
  Home1({
    super.key,
  });

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  MyController c = Get.find();

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
    print(c.localDB.read("userData")['id']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              header(
                name: c.localDB.read("userData")['name'],
              ),
              SizedBox(
                height: 2.h,
              ),
              HomeTransactionItem(),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WidgetTypeTransaction(),
                  WidgetTypeTransaction(),
                  WidgetTypeTransaction(),
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Quick Transaction",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                width: 100.w,
                height: 6.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: CircleAvatar(
                        child: Image.asset("assets/images/Avatar-1.png"),
                        radius: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: CircleAvatar(
                        child: Image.asset("assets/images/Avatar-3.png"),
                        radius: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: CircleAvatar(
                        child: Image.asset("assets/images/Avatar-4.png"),
                        radius: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: CircleAvatar(
                        child: Image.asset("assets/images/Avatar-18.png"),
                        radius: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: CircleAvatar(
                        child: Image.asset("assets/images/Avatar-20.png"),
                        radius: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 14),
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withAlpha(20),
                        child: Icon(CupertinoIcons.add),
                        radius: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaction",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // TransactionListTile(),
              // TransactionListTile(),
              // TransactionListTile(),
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
              //             return ;
              //           }
              //         } else {
              //           return placeholderWhileTransactionBuild();
              //         }
              //     }
              //   },
              // ),

              ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionListTile(
                    name: transactions[index].name,
                    type: transactions[index].type,
                    date: transactions[index].date,
                    amount: transactions[index].amount,
                  );
                },
                shrinkWrap: true,
                itemCount: transactions.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetTypeTransaction extends StatelessWidget {
  const WidgetTypeTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Chip(
            backgroundColor: Colors.grey.withAlpha(20),
            side: BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.only(right: 22, left: 22, top: 15, bottom: 15),
            labelPadding: EdgeInsets.all(0),
            avatar: Icon(
              CupertinoIcons.arrow_down_left,
            ),
            label: Container(
              child: Text("Collect"),
            ))
      ],
    );
  }
}

class header extends StatelessWidget {
  const header({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: Image.asset("assets/images/Avatar-4.png"),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class HomeTransactionItem extends StatelessWidget {
  const HomeTransactionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 20.h,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              "assets/images/bg10.png",
            ),
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total Balance",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              InkWell(
                onTap: () {
                  // Get.dialog(widget)\
                  MyDialog.deletePartnerDialog();
                },
                child: CircleAvatar(
                  child: Icon(Ionicons.qr_code),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "FCFA",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "10,000",
                style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "voir transaction",
                style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    Key? key,
    required this.name,
    required this.type,
    required this.amount,
    required this.date,
  }) : super(key: key);
  final String name;
  final String type;
  final String amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 0.1.h,
        ),
        ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.indigo,
              child: Image.asset("assets/images/Avatar-20.png"),
            ),
            title: Text(
              name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              type,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                    "${DateFormat('dd-MM-yyyy').format(DateTime.parse(date))}"),
              ],
            )),
        Divider(
          thickness: 0.1,
        )
      ],
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
